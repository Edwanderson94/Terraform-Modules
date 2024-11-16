# ================================================================
# Output
# ================================================================

output "repository_ids" {
  description = "IDs dos repositórios criados, associados ao índice e ao nome do repositório"
  value = {
    for repo_name, repo in azuredevops_git_repository.repositories :
    repo_name => {
      id   = repo.id
      name = repo.name
    }
  }
}

output "repository_names" {
  description = "Nomes dos repositórios criados"
  value = [for repo in azuredevops_git_repository.repositories : repo.name]
}

output "repository_default_branch" {
  description = "O branch padrão dos repositórios criados"
  value = { for repo_name, repo in azuredevops_git_repository.repositories : repo_name => repo.default_branch }
}

output "module_version" {
  description = "Versão do módulo"
  value       = local.module_version
}