# ======================================================
# Owner: Edwanderson
# Description: Provisionando Projeto e Configurações
# Project: Azure DevOps com Terraform
# =======================================================

# ======================================================
# Módulo de Criação de repositório
# ======================================================
module "azuredevops_repository" {
  source = "github.com/Edwanderson94/Terraform-Modules//terraform-azdo-modules/azuredevops_repository?ref=main"

  project_id            = data.azuredevops_project.project_infra.id
  org_service_url       = var.org_service_url
  repositories          = var.repositories
  personal_access_token = var.personal_access_token
}
