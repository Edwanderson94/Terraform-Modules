# Definindo a versão do módulo
locals {
  module_version = "1.0.0"
}

# Criando um mapa de repositórios onde a chave é o nome do repositório
locals {
  repositories_map = {
    for repo_key, repo_value in var.repositories :
    repo_key => {
      name           = repo_value.name
      default_branch = repo_value.default_branch
    }
  }
}