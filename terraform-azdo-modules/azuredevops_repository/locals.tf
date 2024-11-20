# Definindo a versão do módulo
locals {
  module_version = "1.0.0"
}

# Criando um mapa de repositórios onde a chave é o nome do repositório
locals {
  repositories_map = {
    for repo in var.repositories :
    repo.name => {
      name           = repo.name
      default_branch = repo.default_branch
    }
  }
}