variable "compartment_id" {
  description = "OCID do compartment OCI que receberá o bucket."
  type        = string
  nullable    = false

  validation {
    condition     = trimspace(var.compartment_id) != ""
    error_message = "compartment_id não pode ser vazio."
  }
}

variable "name" {
  description = "Nome globalmente único no namespace OCI do bucket."
  type        = string
  nullable    = false

  validation {
    condition     = trimspace(var.name) != ""
    error_message = "name não pode ser vazio."
  }
}

variable "freeform_tags" {
  description = "Mapa opcional de freeform tags aplicado ao bucket."
  type        = map(string)
  default     = {}
  nullable    = false
}
