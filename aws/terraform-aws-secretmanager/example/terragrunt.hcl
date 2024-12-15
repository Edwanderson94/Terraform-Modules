# Inclui o arquivo terragrunt.hcl do diretório raiz
include {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/Edwanderson94/Terraform-Modules//aws/terraform-aws-secretmanager?ref=main"
}

inputs = {
  region      = "sa-east-1"
  secrets = {
    "azuredevops/terraform/" = "password123"
  }

  recovery_windows = {
    "azuredevops/terraform/" = 8
  }

  default_recovery_window_in_days = 7
}