output "bucket_id" {
  description = "OCID atribuído pela OCI ao bucket."
  value       = oci_objectstorage_bucket.this.bucket_id
}

output "name" {
  description = "Nome do bucket."
  value       = oci_objectstorage_bucket.this.name
}

output "namespace" {
  description = "Namespace OCI do bucket."
  value       = oci_objectstorage_bucket.this.namespace
}

output "terraform_id" {
  description = "ID de gerenciamento/importação do recurso no provider Terraform OCI."
  value       = oci_objectstorage_bucket.this.id
}
