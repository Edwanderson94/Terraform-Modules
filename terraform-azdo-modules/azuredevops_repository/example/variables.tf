# ======================================================
# Variables
# ======================================================

variable "org_service_url" {
  description = "URL da sua organization no Azure DevOps"
  type        = string
  default     = "https://dev.azure.com/<SUA-ORG>"
}

variable "personal_access_token" {
  description = "PAT de acesso a sua organization no Azure DevOps"
  type        = string
  sensitive   = true
  default     = ""
}

variable "repositories" {
  description = "Mapa de repositórios a serem criados, com os nomes e branches padrões"
  type = map(object({
    name           = string
    default_branch = string
  }))
  default = {

    "repo-01" = {
      name           = "repo-01"
      default_branch = "main"
    },

    "repo-02" = {
      name           = "repo-02"
      default_branch = "dev"
    },

    "repo-03" = {
      name           = "repo-03"
      default_branch = "uat"
    }
  }
}