variable "project_id" {
  description = "ID do projeto Azure DevOps existente que receberá a pipeline."
  type        = string
}

variable "name" {
  description = "Nome da definição da pipeline."
  type        = string
}

variable "repository_id" {
  description = "ID do repositório Azure Repos (TfsGit) que contém o YAML."
  type        = string
}

variable "branch_name" {
  description = "Ref Git usada como branch padrão/configurada para a pipeline. Ex.: refs/heads/master."
  type        = string
  default     = "refs/heads/master"
}

variable "yml_path" {
  description = "Caminho do YAML da pipeline relativo à raiz do repositório."
  type        = string
  default     = "/azure-pipelines.yml"
}

variable "path" {
  description = "Pasta da definição no Azure DevOps. Use \\ para a raiz."
  type        = string
  default     = "\\"
}

variable "agent_pool_name" {
  description = "Pool de agentes usado pela definição."
  type        = string
  default     = "Azure Pipelines"
}

variable "queue_status" {
  description = "Estado da definição: enabled, paused ou disabled."
  type        = string
  default     = "enabled"

  validation {
    condition     = contains(["enabled", "paused", "disabled"], var.queue_status)
    error_message = "queue_status deve ser enabled, paused ou disabled."
  }
}
