output "id" {
  description = "ID do Variable Group criado ou gerenciado."
  value       = azuredevops_variable_group.this.id
}

output "name" {
  description = "Nome do Variable Group."
  value       = azuredevops_variable_group.this.name
}
