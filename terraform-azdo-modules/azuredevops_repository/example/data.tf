# ======================================================
# Owner: Edwanderson
# Description: Módulo de Repositórios
# Project: Exemplo de Módulo de repositórios
# =======================================================

# ============================================================
# Captura de informações sobre Projeto
# ============================================================
data "azuredevops_project" "project_infra" {
  name = "Infrastructure"
}
