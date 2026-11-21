# Findings — GitFlow Guardrails

## Estado em 2026-11-21

- Produção: `master`; `origin/master` aponta para `d1b0697`, também tag `v1.5.0`.
- Não há branches locais/remotas de trabalho após a limpeza solicitada.
- O workflow existente `terraform-format.yml` valida Terraform, TFLint e Trivy em PRs para `master`/`release/**`.
- Não há rulesets configurados no repositório; proteções administrativas e required checks ainda precisam ser confirmados/configurados em etapa posterior.
- O workflow de referência valida origem/destino e nomenclatura, mas a publicação automática de tags requer permissões `contents: write` e não deve entrar no passo inicial.
- A convenção observada é `release/X.Y.Z`, sem o prefixo `v` no nome da branch; tags usam `vX.Y.Z`.

## Decisões iniciais

- Passo 1 será somente validação preventiva/detectiva em PR, com `contents: read`.
- O fluxo permitido é `feature|fix|docs|hotfix -> release/X.Y.Z -> master`.
- O guardrail não substitui branch rulesets/required checks; sem proteção administrativa, o workflow falha o check, mas não impede sozinho um bypass autorizado.
- A publicação de tag/release, Conventional Commits e validação avançada de SemVer ficam para passos posteriores e aprovação explícita.
