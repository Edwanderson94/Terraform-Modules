terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "1.4.0"
    }
  }

  backend "local" {} # Backend vazio para permitir o uso do Terragrunt
}