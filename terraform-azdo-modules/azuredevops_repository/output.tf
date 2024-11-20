# ================================================================
# Output
# ================================================================

output "module_version" {
  description = "Versão do módulo"
  value       = local.module_version
}

output "repository_urls" {
  description = "Lista de URLs dos repositórios criados"
  value = {
    for repo in azuredevops_git_repository.repositories :
    repo.name => repo.web_url
  }
}