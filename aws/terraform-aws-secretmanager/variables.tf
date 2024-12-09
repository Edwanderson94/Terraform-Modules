variable "secrets" {
  description = "Mapa de secrets e seus valores"
  type = map(string)
}

variable "region" {
  description = "Região da AWS para os recursos"
  type        = string
}

variable "aws_profile" {
  description = "Perfil AWS do CLI a ser usado"
  type        = string
  default     = "default"
}

# variable "secrets" {
#   description = "Mapa de secrets e seus valores"
#   default = {
#     "azuredevops/terraform/" = "password123"
#   }
# }