variable "oci_profile" {
  description = "Nome do profile no arquivo OCI config, sem armazenar credenciais no código."
  type        = string
  default     = "DEFAULT"
}

variable "region" {
  description = "Região OCI de destino, por exemplo sa-saopaulo-1."
  type        = string
}

variable "compartment_id" {
  description = "OCID do compartment de destino."
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket, único no namespace OCI."
  type        = string
}

variable "freeform_tags" {
  description = "Tags livres opcionais para o bucket."
  type        = map(string)
  default     = {}
}
