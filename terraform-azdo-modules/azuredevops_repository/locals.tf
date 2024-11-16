locals {
  # Se criar múltiplos repositórios, utilizamos a lista fornecida diretamente
  # Caso contrário, criamos um mapa com um único repositório
  repositories_to_create = var.create_multiple_repositories ? var.repositories : [var.repositories[0]]
}

# Definindo a versão do módulo
locals {
  module_version = "1.1.0"
}