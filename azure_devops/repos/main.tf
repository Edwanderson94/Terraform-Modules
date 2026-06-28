# ================================================================
# Owner: Edwanderson
# Description: Module for creating and renaming Azure DevOps repositories
# Project: Terraform module for Azure DevOps
# ================================================================

resource "azuredevops_git_repository" "repositories" {
  for_each = local.repositories_map

  project_id     = data.azuredevops_project.project_infra.id
  name           = each.value.name
  default_branch = "refs/heads/${each.value.default_branch}"

  initialization {
    init_type = "Clean"
  }

  lifecycle {
    ignore_changes = [default_branch]
  }
}

resource "null_resource" "repository_branch_standard" {
  for_each = local.repositories_map

  triggers = merge(
    {
      branches        = join(",", local.repository_branches)
      default_branch  = each.value.default_branch
      org_service_url = var.org_service_url
      project_name    = var.project_name
      repository_id   = azuredevops_git_repository.repositories[each.key].id
      repository_name = each.value.name
    },
    length(lookup(var.repository_branch_renames, each.key, {})) > 0 ? {
      branch_renames = jsonencode(lookup(var.repository_branch_renames, each.key, {}))
    } : {},
    length(lookup(var.repository_branches_to_delete, each.key, [])) > 0 ? {
      branches_to_delete = jsonencode(lookup(var.repository_branches_to_delete, each.key, []))
    } : {}
  )

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]

    environment = {
      AZDO_BRANCHES              = join(",", local.repository_branches)
      AZDO_BRANCHES_TO_DELETE    = jsonencode(lookup(var.repository_branches_to_delete, each.key, []))
      AZDO_BRANCH_RENAMES        = jsonencode(lookup(var.repository_branch_renames, each.key, {}))
      AZDO_DEFAULT_BRANCH        = each.value.default_branch
      AZDO_ORG_SERVICE_URL       = var.org_service_url
      AZDO_PERSONAL_ACCESS_TOKEN = var.personal_access_token
      AZDO_PROJECT_NAME          = var.project_name
      AZDO_REPOSITORY_ID         = azuredevops_git_repository.repositories[each.key].id
      AZDO_REPOSITORY_NAME       = each.value.name
    }

    command = <<-EOT
python3 <<'PY'
import base64
import json
import os
import sys
import urllib.parse
import urllib.request

org_url = os.environ["AZDO_ORG_SERVICE_URL"].rstrip("/")
project_name = os.environ["AZDO_PROJECT_NAME"]
repository_id = os.environ["AZDO_REPOSITORY_ID"]
repository_name = os.environ["AZDO_REPOSITORY_NAME"]
default_branch = os.environ["AZDO_DEFAULT_BRANCH"].strip()
branches = [branch.strip() for branch in os.environ["AZDO_BRANCHES"].split(",") if branch.strip()]
branch_renames = json.loads(os.environ.get("AZDO_BRANCH_RENAMES", "{}"))
branches_to_delete = json.loads(os.environ.get("AZDO_BRANCHES_TO_DELETE", "[]"))

if default_branch not in branches:
    branches.append(default_branch)

branches = list(dict.fromkeys(branches))

token = os.environ["AZDO_PERSONAL_ACCESS_TOKEN"]
authorization = base64.b64encode(f":{token}".encode("utf-8")).decode("ascii")
headers = {
    "Authorization": f"Basic {authorization}",
    "Accept": "application/json",
    "Content-Type": "application/json",
}

project_path = urllib.parse.quote(project_name, safe="")
repository_path = urllib.parse.quote(repository_id, safe="")
base_url = f"{org_url}/{project_path}/_apis/git/repositories/{repository_path}"

def request(method, path, payload=None):
    data = json.dumps(payload).encode("utf-8") if payload is not None else None
    req = urllib.request.Request(f"{base_url}{path}", data=data, headers=headers, method=method)
    with urllib.request.urlopen(req) as response:
        body = response.read().decode("utf-8")
        return json.loads(body) if body else None

repository = request("GET", "?api-version=7.1")
refs = request("GET", "/refs?filter=heads/&api-version=7.1").get("value", [])
existing = {
    ref["name"].replace("refs/heads/", ""): ref["objectId"]
    for ref in refs
    if ref["name"].startswith("refs/heads/")
}

current_default = repository.get("defaultBranch", "").replace("refs/heads/", "")
source_branch = (
    default_branch
    if default_branch in existing
    else current_default
    if current_default in existing
    else next(iter(existing), None)
)

if source_branch is None:
    print(f"Repository {repository_name} has no source branch to clone from.", file=sys.stderr)
    sys.exit(1)

source_object_id = existing[source_branch]

for old_branch, new_branch in branch_renames.items():
    old_branch = old_branch.strip()
    new_branch = new_branch.strip()

    if not old_branch or not new_branch or old_branch == new_branch:
        continue

    if old_branch not in existing:
        continue

    if new_branch not in existing:
        result = request(
            "POST",
            "/refs?api-version=7.1",
            [
                {
                    "name": f"refs/heads/{new_branch}",
                    "oldObjectId": "0000000000000000000000000000000000000000",
                    "newObjectId": existing[old_branch],
                }
            ],
        )

        if result and result.get("value") and not result["value"][0].get("success", False):
            message = result["value"][0].get("customMessage") or result["value"][0].get("updateStatus")
            raise RuntimeError(f"Could not create branch {new_branch} from {old_branch} in {repository_name}: {message}")

        existing[new_branch] = existing[old_branch]

    if old_branch not in branches_to_delete:
        branches_to_delete.append(old_branch)

for branch in branches:
    if branch in existing:
        continue

    result = request(
        "POST",
        "/refs?api-version=7.1",
        [
            {
                "name": f"refs/heads/{branch}",
                "oldObjectId": "0000000000000000000000000000000000000000",
                "newObjectId": source_object_id,
            }
        ],
    )

    if result and result.get("value") and not result["value"][0].get("success", False):
        message = result["value"][0].get("customMessage") or result["value"][0].get("updateStatus")
        raise RuntimeError(f"Could not create branch {branch} in {repository_name}: {message}")

    existing[branch] = source_object_id

desired_default_ref = f"refs/heads/{default_branch}"
if repository.get("defaultBranch") != desired_default_ref:
    request("PATCH", "?api-version=7.1", {"defaultBranch": desired_default_ref})

protected_branches = set(branches)
protected_branches.add(default_branch)

for branch in branches_to_delete:
    branch = branch.strip()
    if not branch or branch not in existing:
        continue

    if branch in protected_branches:
        raise RuntimeError(f"Branch {branch} is protected by repository_branches/default_branch and cannot be deleted from {repository_name}.")

    result = request(
        "POST",
        "/refs?api-version=7.1",
        [
            {
                "name": f"refs/heads/{branch}",
                "oldObjectId": existing[branch],
                "newObjectId": "0000000000000000000000000000000000000000",
            }
        ],
    )

    if result and result.get("value") and not result["value"][0].get("success", False):
        message = result["value"][0].get("customMessage") or result["value"][0].get("updateStatus")
        raise RuntimeError(f"Could not delete branch {branch} in {repository_name}: {message}")

    del existing[branch]

print(f"Standardized {repository_name}: branches={','.join(branches)} default={default_branch}")
PY
EOT
  }

  depends_on = [azuredevops_git_repository.repositories]
}
