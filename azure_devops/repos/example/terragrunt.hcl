# Inclui o arquivo terragrunt.hcl do diretorio raiz
include {
  path = find_in_parent_folders()
}

terraform {
  source = get_env(
    "TG_AZURE_DEVOPS_REPOSITORIES_MODULE_SOURCE",
    "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/repos?ref=develop"
  )
}

locals {
  repository_names = {
    aws   = "cloud-aws-infra"
    oci   = "cloud-oci-infra"
    azure = "cloud-azure-infra"
    gcp   = "cloud-gcp-infra"
  }

  repository_default_branch = "master"
  repository_branches       = ["develop", "homolog", "master"]

  repositories = {
    for key, name in local.repository_names : key => {
      name           = name
      default_branch = local.repository_default_branch
    }
  }
}

inputs = {
  project_name          = "nome-do-seu-projeto"
  org_service_url       = get_env("AZDO_ORG_SERVICE_URL", "https://dev.azure.com/nome-da-sua-organizacao")
  personal_access_token = get_env("AZDO_PERSONAL_ACCESS_TOKEN")
  repositories          = local.repositories
  repository_branches   = local.repository_branches

  repository_branch_renames     = {}
  repository_branches_to_delete = {}
}
