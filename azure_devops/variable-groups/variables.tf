variable "project_id" {
  description = "ID do projeto Azure DevOps existente."
  type        = string

  validation {
    condition     = trimspace(var.project_id) != ""
    error_message = "project_id não pode ser vazio."
  }
}

variable "name" {
  description = "Nome do Variable Group."
  type        = string

  validation {
    condition     = trimspace(var.name) != ""
    error_message = "name não pode ser vazio."
  }
}

variable "description" {
  description = "Descrição opcional do Variable Group."
  type        = string
  default     = null
}

variable "allow_access" {
  description = "Permite que todos os pipelines do projeto usem o Variable Group."
  type        = bool
  default     = false
}

variable "variables" {
  description = "Mapa de variáveis não secretas, indexado pelo nome da variável."
  type        = map(string)
  default     = {}
}

variable "secret_variables" {
  description = "Mapa de variáveis secretas, indexado pelo nome da variável."
  type        = map(string)
  default     = {}
  sensitive   = true

  validation {
    condition     = length(setintersection(toset(keys(var.variables)), toset(keys(var.secret_variables)))) == 0
    error_message = "Uma variável não pode existir simultaneamente em variables e secret_variables."
  }
}

variable "key_vault" {
  description = "Configuração opcional para vincular o Variable Group a um Azure Key Vault."
  type = object({
    name                = string
    service_endpoint_id = string
    search_depth        = number
  })
  default = null
}

