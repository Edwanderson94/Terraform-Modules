# ================================================================
# Owner: Edwanderson
# Description: Provisionando Repositórios e suas Configurações
# Project: Azure DevOps com Terraform
# =================================================================

output "module_version" {
  value = module.azuredevops_repository.module_version
}