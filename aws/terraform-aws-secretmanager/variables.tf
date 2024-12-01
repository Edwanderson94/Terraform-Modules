variable "secrets" {
  description = "Mapa de secrets e seus valores"
  type = map(string)
}

variable "region" {
  description = "Região onde os secrets serão armazenados"
  type        = string
  default     = "us-east-1"
}