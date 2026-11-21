variable "project_id" {
  description = "ID do projeto Azure DevOps existente que receberá o Environment."
  type        = string

  validation {
    condition     = trimspace(var.project_id) != ""
    error_message = "project_id não pode ser vazio."
  }
}

variable "name" {
  description = "Nome do Environment Azure DevOps."
  type        = string

  validation {
    condition     = trimspace(var.name) != ""
    error_message = "name não pode ser vazio."
  }
}

variable "description" {
  description = "Descrição opcional do Environment."
  type        = string
  default     = null
}
