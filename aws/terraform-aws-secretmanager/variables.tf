variable "secrets" {
  description = "Mapa de secrets e seus valores"
  type = map(string)
}

variable "region" {
  description = "Região da AWS para os recursos"
  type        = string
}