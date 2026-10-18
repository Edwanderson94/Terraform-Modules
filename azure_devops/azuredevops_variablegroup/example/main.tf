terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "1.4.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}

data "azuredevops_project" "target" {
  name = var.project_name
}

module "azuredevops_variablegroup" {
  source = "../"

  project_id = data.azuredevops_project.target.id
  name       = var.variable_group_name

  variables = {
    TF_LOG = "WARN"
  }
}
