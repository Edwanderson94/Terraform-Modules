# ================================================================
# Owner: Edwanderson
# Description: Módulo de Criação de Repositórios
# Project: Módulo de Terraform para Azure DevOps
# =================================================================

resource "azuredevops_git_repository" "repositories" {
  for_each = { for idx, repo in local.repositories_to_create : "repository_${idx}" => repo }

  project_id     = var.project_id
  name           = each.value.name
  default_branch = "refs/heads/${each.value.default_branch}"

  initialization {
    init_type = "Clean"
  }
}