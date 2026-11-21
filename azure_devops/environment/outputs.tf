output "id" {
  description = "ID do Environment gerenciado."
  value       = azuredevops_environment.this.id
}

output "name" {
  description = "Nome do Environment gerenciado."
  value       = azuredevops_environment.this.name
}

output "project_id" {
  description = "ID do projeto Azure DevOps associado ao Environment."
  value       = azuredevops_environment.this.project_id
}
