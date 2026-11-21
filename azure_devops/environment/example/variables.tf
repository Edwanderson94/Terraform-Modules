variable "project_name" {
  description = "Nome do projeto Azure DevOps existente."
  type        = string
}

variable "environment_name" {
  description = "Nome do Environment a ser gerenciado."
  type        = string
  default     = "example"
}

variable "environment_description" {
  description = "Descrição do Environment de exemplo."
  type        = string
  default     = "Managed by Terraform"
}
