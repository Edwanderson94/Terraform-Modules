# Inclui o arquivo terragrunt.hcl do diretório pai
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//terraform-azdo-modules/azuredevops_repository?ref=<versao-modulo>>"
}

inputs = {
  project_name          = "nome-do-seu-projeto"
  org_service_url       = "https://dev.azure.com/nome-do-seu-projeto"
  personal_access_token = "seu-token-pat-do-azure-devops"

  repositories = {
    "repo-01" = {
      name           = "repo-01"
      default_branch = "main"
    },

    "repo-02" = {
      name           = "repo-02"
      default_branch = "dev"
    },

    "repo-03" = {
      name           = "repo-03"
      default_branch = "uat"
    }
  }
}