variable "compartment_id" {
  description = "OCID do compartment que recebera o bucket"
  type        = string
  nullable    = false
}

variable "name" {
  description = "Nome do bucket"
  type        = string
  nullable    = false
}

variable "freeform_tags" {
  description = "Tags livres aplicadas ao bucket"
  type        = map(string)
  default     = {}
}
