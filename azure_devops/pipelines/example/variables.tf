variable "org_service_url" {
  description = "URL da organização Azure DevOps."
  type        = string
}

variable "personal_access_token" {
  description = "PAT fornecido por variável de ambiente/secret store."
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Projeto Azure DevOps existente."
  type        = string
}

variable "repository_name" {
  description = "Repositório Azure Repos existente."
  type        = string
}

variable "pipeline_name" {
  description = "Nome da pipeline a registrar."
  type        = string
}

variable "branch_name" {
  description = "Branch Git que contém o YAML."
  type        = string
  default     = "refs/heads/master"
}

variable "yml_path" {
  description = "Caminho do YAML no repositório."
  type        = string
  default     = "/azure-pipelines.yml"
}
