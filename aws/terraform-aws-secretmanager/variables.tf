variable "secrets" {
  description = "Mapa de secrets e seus valores"
  type = map(string)
}

variable "region" {
  description = "Região da AWS para os recursos"
  type        = string
}

variable "recovery_windows" {
  description = "Mapa opcional com tempos de recuperação (em dias) para cada segredo"
  type        = map(number)
  default     = {}
}

variable "default_recovery_window_in_days" {
  description = "Tempo padrão de recuperação (em dias) para segredos"
  type        = number
  default     = 7
}