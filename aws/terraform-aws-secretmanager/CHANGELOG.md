# Changelog

Todas as mudanças importantes deste projeto serão documentadas neste arquivo.

O formato segue o padrão [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), 
e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [Unreleased]
### Adicionado
- Configuração inicial de módulos Terraform para criação de recursos no AWS S3.
- Template básico para definição e reutilização de módulos Terraform.
- Configuração inicial para uso com Terragrunt.

### Corrigido
- Correção de erros de digitação na documentação inicial.
- Ajustes nos exemplos para refletir a sintaxe atualizada do Terraform.

### Removido
- Dependência obsoleta do Terraform 0.12, migrando para versões mais recentes.

## [1.0.0] - 2024-11-24
### Adicionado
- Módulo inicial do Terraform para gerenciamento de repositórios no Azure DevOps.
- Suporte à criação automatizada de repositórios com configuração da branch padrão.
- Documentação inicial do projeto para facilitar a configuração e o uso.