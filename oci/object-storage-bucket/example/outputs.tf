output "bucket_id" {
  description = "OCID do bucket."
  value       = module.state_bucket.bucket_id
}

output "name" {
  description = "Nome do bucket."
  value       = module.state_bucket.name
}

output "namespace" {
  description = "Namespace OCI."
  value       = module.state_bucket.namespace
}
