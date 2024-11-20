# ================================================================
# Variables
# ================================================================

variable "repositories" {
  description = "Mapa de repositórios para criar"
  type = map(object({
    name           = string
    default_branch = string
  }))

  validation {
    condition     = length(var.repositories) >= 1 && length(var.repositories) <= 5
    error_message = "O número de repositórios deve estar entre 1 e 5."
  }
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