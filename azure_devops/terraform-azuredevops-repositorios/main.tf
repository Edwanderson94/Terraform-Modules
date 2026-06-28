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
}
