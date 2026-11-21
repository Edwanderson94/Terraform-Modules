data "azuredevops_project" "example" {
  name = var.project_name
}

module "environment" {
  source = "./.."

  project_id  = data.azuredevops_project.example.id
  name        = var.environment_name
  description = var.environment_description
}
