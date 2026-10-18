variable "org_service_url" {
  description = "URL da organização Azure DevOps."
  type        = string
}

variable "personal_access_token" {
  description = "PAT fornecido por variável de ambiente ou secret store."
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Nome do projeto Azure DevOps existente."
  type        = string
}

variable "variable_group_name" {
  description = "Nome do Variable Group a criar."
  type        = string
}
