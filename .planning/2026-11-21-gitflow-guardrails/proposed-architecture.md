# Arquitetura incremental proposta

## Passo 1 — concluído localmente

Workflow de PR com permissões mínimas, origem canônica e fluxo de branches. Validado com `actionlint`.

## Passo 2 — próximo

Formalizar regras administrativas: required checks, restrição de push em `master`/`release/**`, política de merge e proteção de tags. Isso não pode ser substituído por YAML.

## Passo 3 — governança de commits e versão

Adicionar checks independentes para Conventional Commits, cálculo/revisão da próxima versão e SemVer. O check deve produzir mensagens claras e não duplicar a CI Terraform.

## Passo 4 — publicação

Adicionar job de tag/release somente após merge autorizado em `master`, conferindo merge commit, tag inexistente, SemVer e permissões de escrita. A criação de release deve usar a tag imutável como fonte.

## Rollback

O rollback do workflow é reversível por PR/commit. Tags e releases publicadas não devem ser movidas; correções devem usar uma nova versão. Rulesets devem ser alterados administrativamente com registro da configuração anterior.
