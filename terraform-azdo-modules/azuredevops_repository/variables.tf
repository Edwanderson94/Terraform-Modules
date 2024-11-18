# ================================================================
# Variables
# ================================================================

variable "org_service_url" {
  type = string
}

variable "personal_access_token" {
  type      = string
  sensitive = true
}

variable "project_id" {
  type = string
}

variable "create_multiple_repositories" {
  description = "Flag para determinar se múltiplos repositórios devem ser criados"
  type        = bool
  default     = false
}

variable "repositories" {
  description = "Lista de repositórios para criar"
  type = list(object({
    name           = string
    default_branch = string
  }))

  validation {
    condition     = length(var.repositories) >= 1 && length(var.repositories) <= 5
    error_message = "O número de repositórios deve estar entre 1 e 5."
  }
}