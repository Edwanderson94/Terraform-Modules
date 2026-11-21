resource "azuredevops_environment" "this" {
  project_id  = var.project_id
  name        = var.name
  description = var.description

  lifecycle {
    prevent_destroy = true
  }
}
