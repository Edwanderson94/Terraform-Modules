# Progress — GitFlow Guardrails

## 2026-11-21

- Contexto recuperado do objetivo e das instruções do repositório.
- Confirmado `master` em `d1b0697` / `v1.5.0`, sem branches de trabalho restantes.
- Preservadas alterações locais não relacionadas.
- Criado o workflow local `.github/workflows/gitflow-guardrails.yml` com trigger de PR, `contents: read`, concorrência e validação de origem/destino.
- Próximo: rodar `actionlint`, revisar diff e sincronizar o marco no Trello.
- `actionlint`, `git diff --check` e revisão de status concluídos sem erro.
- Card principal movido para `Andamento` e atualizado com checkpoint; confirmação lida de volta.
- Matriz, política GitFlow, arquitetura, segurança, rollout, ADR e integração com a CI adicionados.
- `actionlint` passou nos workflows de GitFlow e Terraform; `git diff --check` passou.
- Adicionado check local de título Conventional Commit; validação de range completo e publicação permanecem separadas.
- Criado e executado harness local com casos positivos e negativos de fluxo, origem e título.
- O primeiro harness revelou erro de parsing Bash na regex de Conventional Commits; regex foi isolada em variável e corrigida no workflow e no harness.
- Após a correção: `bash -n`, harness, `actionlint` dos dois workflows e `git diff --check` passaram.
- Incluídos no harness casos explícitos de versão/tag SemVer conforme a convenção atual `vX.Y.Z`.
