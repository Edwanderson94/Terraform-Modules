terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "1.4.0"
    }
  }

  # Bloco de backend vazio, para o terragrunt capturar.
  backend "local" {}
}

provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}