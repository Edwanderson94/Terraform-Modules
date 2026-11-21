terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 1.4.0, < 2.0.0"
    }
  }
}

provider "azuredevops" {
  # Authentication is supplied by the consumer environment.
}
