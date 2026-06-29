# ================================================================
# Variables
# ================================================================

variable "repositories" {
  description = "Mapa de repositorios gerenciados. Use uma chave logica estavel para permitir renomear o repositorio alterando apenas o campo name"
  type = map(object({
    name           = string
    default_branch = string
    initialize     = optional(bool, true)
  }))
}

variable "repository_branches" {
  description = "Lista de branches que devem existir em todos os repositorios gerenciados"
  type        = list(string)
  default     = ["develop", "homolog", "master"]
}

variable "repository_branch_renames" {
  description = "Mapa por repositorio para renomear branches. Exemplo: { aws = { main = \"master\" } }"
  type        = map(map(string))
  default     = {}
}

variable "repository_branches_to_delete" {
  description = "Mapa por repositorio com branches que devem ser removidas. A branch default e branches desejadas nao podem ser deletadas"
  type        = map(list(string))
  default     = {}
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
