# Análise do workflow de referência

Referência: `/home/edwanderson/wsl-repo/Terraform/.github/workflows/gitflow-guardrails.yml`.

| Guardrail | Implementação atual | Finalidade | Reutilizável | Adaptação necessária |
|---|---|---|---|---|
| Eventos de PR | `opened`, `synchronize`, `reopened`, `ready_for_review`, `closed` | Revalidar mudanças e reagir ao merge | Sim | Passo 1 usa eventos não fechados; publicação fica separada |
| Destinos | `master` e `release/**` | Limitar o domínio do check | Sim | Manter os dois destinos |
| Origem canônica | Compara `head.repo.full_name` com `github.repository` | Impedir PR de fork | Sim | Manter com `contents: read` |
| Release como destino | Regex `release/X.Y.Z`; origem `feature|fix|docs` | Encaminhar trabalho para release | Parcial | Incluir `hotfix` conforme política do card |
| Master como destino | Exige `release/X.Y.Z` ou `hotfix/X.Y.Z` | Impedir trabalho direto em produção | Parcial | Exigir somente release versionada; hotfix passa por release |
| Tag pós-merge | Job fechado/merged com `contents: write` | Criar tag anotada no merge commit | Não no passo 1 | Separar em job posterior, com regras e aprovação explícitas |
| SemVer | Regex da branch e tag | Evitar versões inválidas | Parcial | Adicionar parser/validação de precedência depois |
| Conventional Commits | Não implementado | Rastreabilidade de mudança | Não | Definir check separado, sem duplicar CI Terraform |
| Proteção administrativa | Não está no YAML | Tornar checks obrigatórios e impedir bypass | Não | Rulesets/branch protection precisam de configuração GitHub |

## Limitações observadas

O workflow de referência é um check detectivo. Ele só se torna preventivo quando o GitHub exige seu status como required check e restringe quem pode fazer merge/push. O job de tag requer permissão de escrita e deve ser tratado como uma superfície de publicação separada, com identidade, condições e auditoria próprias.
