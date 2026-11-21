# Matriz de guardrails

| Controle | Camada | Estado alvo | Evidência | Risco residual |
|---|---|---|---|---|
| PR de trabalho para `master` | Workflow + ruleset | Bloqueado | Workflow falha se head não é `release/X.Y.Z` | Bypass sem required check |
| PR de release para `master` | Workflow + ruleset | Permitido | Regex de destino/origem | Branch pode conter conteúdo não validado se checks não forem required |
| PR de trabalho para `release/X.Y.Z` | Workflow + CI | Permitido | Regex de branch e CI existente | Release branch precisa ser criada a partir de master por regra administrativa |
| PR de fork | Workflow | Bloqueado | Comparação do repositório head | Bypass administrativo |
| Tag fora de master | Ruleset/tag policy + publicação | Bloqueado | A definir no passo de publicação | Tags existentes/históricas não devem ser alteradas |
| Tag no merge commit | Publicação | Permitido | Verificação explícita de `HEAD == merge_commit_sha` | Permissão de escrita do token |
| Versão inválida | Workflow de release | Bloqueado | SemVer estrito | Convenção de branch precisa permanecer estável |
| Commit não convencional | Check de commits | Bloqueado | A definir | Squash/rebase pode ocultar commits originais |
| Terraform quality gates | CI existente | Mantido | `terraform-format.yml` | TFLint tem warnings legados tolerados |

## Preventivo versus detectivo

- Preventivo: rulesets, branch protection, required status checks, restrição de push e proteção de tags.
- Detectivo: workflow de origem/destino, validação de nomes, Conventional Commits, SemVer e auditoria pós-merge.
- A implementação só deve chamar um caminho de “bloqueado” quando o check estiver configurado como obrigatório no GitHub.
