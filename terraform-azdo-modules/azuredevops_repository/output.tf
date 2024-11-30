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
    for key, repo in azuredevops_git_repository.repositories :
    key => repo.web_url
  }
}