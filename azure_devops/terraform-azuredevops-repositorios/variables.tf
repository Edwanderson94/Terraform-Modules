# ================================================================
# Variables
# ================================================================

variable "repositories" {
  description = "Mapa de repositorios gerenciados. Use uma chave logica estavel para permitir renomear o repositorio alterando apenas o campo name"
  type = map(object({
    name           = string
    default_branch = string
  }))
}

variable "org_service_url" {
  description = "URL da sua organization no Azure DevOps"
  type        = string
}

variable "personal_access_token" {
  description = "PAT de acesso a sua organization no Azure DevOps"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Nome do projeto no Azure DevOps"
  type        = string
}
