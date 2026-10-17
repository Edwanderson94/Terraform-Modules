output "bucket_id" {
  description = "OCID do bucket criado"
  value       = oci_objectstorage_bucket.this.id
}

output "name" {
  description = "Nome do bucket"
  value       = oci_objectstorage_bucket.this.name
}

output "namespace" {
  description = "Namespace OCI do bucket"
  value       = oci_objectstorage_bucket.this.namespace
}
