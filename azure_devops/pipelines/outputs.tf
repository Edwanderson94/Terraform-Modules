output "id" {
  description = "ID da definição da pipeline Azure DevOps."
  value       = azuredevops_build_definition.this.id
}

output "revision" {
  description = "Revisão atual da definição da pipeline."
  value       = azuredevops_build_definition.this.revision
}

output "name" {
  description = "Nome da definição da pipeline."
  value       = var.name
}
