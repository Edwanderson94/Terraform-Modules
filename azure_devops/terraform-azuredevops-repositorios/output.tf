# ================================================================
# Output
# ================================================================

output "module_version" {
  description = "Versao do modulo"
  value       = local.module_version
}

output "repository_urls" {
  description = "Lista de URLs dos repositorios gerenciados"
  value = {
    for key, repo in azuredevops_git_repository.repositories :
    key => repo.web_url
  }
}
