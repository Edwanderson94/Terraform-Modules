# ================================================================
# Variables
# ================================================================

variable "repositories" {
  description = "Lista de repositórios a serem criados"
  type = map(object({
    name           = string
    default_branch = string
  }))
}

variable "project_id" {
  description = "ID do projeto no Azure DevOps"
  type        = string
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
}