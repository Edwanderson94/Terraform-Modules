# Changelog

Todas as mudancas importantes deste projeto serao documentadas neste arquivo.

O formato segue o padrao [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
e este projeto adere ao [Versionamento Semantico](https://semver.org/lang/pt-BR/).

## [Unreleased]

### Adicionado

- Padronizacao de branches `develop`, `homolog` e `master` nos repositorios gerenciados.
- Configuracao de `master` como branch padrao via execucao idempotente no Azure DevOps.
- Opcoes para criar, renomear e deletar branches por repositorio.
- Suporte documentado para renomear repositorios mantendo uma chave logica estavel no mapa `repositories`.
- Configuracao inicial de modulos Terraform para criacao de recursos no AWS S3.
- Template basico para definicao e reutilizacao de modulos Terraform.
- Configuracao inicial para uso com Terragrunt.

### Corrigido

- Correcao de erros de digitacao na documentacao inicial.
- Ajustes nos exemplos para refletir a sintaxe atualizada do Terraform.

### Removido

- Dependencia obsoleta do Terraform 0.12, migrando para versoes mais recentes.

## [1.0.0] - 2024-11-24

### Adicionado

- Modulo inicial do Terraform para gerenciamento de repositorios no Azure DevOps.
- Suporte a criacao automatizada de repositorios com configuracao da branch padrao.
- Documentacao inicial do projeto para facilitar a configuracao e o uso.
