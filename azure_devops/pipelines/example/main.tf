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

data "azuredevops_git_repositories" "target" {
  project_id = data.azuredevops_project.target.id
  name       = var.repository_name
}

module "pipeline" {
  source = "../"

  project_id    = data.azuredevops_project.target.id
  name          = var.pipeline_name
  repository_id = one(data.azuredevops_git_repositories.target.repositories[*].id)
  branch_name   = var.branch_name
  yml_path      = var.yml_path
}
