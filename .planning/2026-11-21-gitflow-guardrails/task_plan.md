# GitFlow Guardrails — Terraform-Modules

## Objetivo

Estudar e implantar incrementalmente guardrails de GitFlow e governança de releases, preservando o repositório de referência e os trabalhos locais existentes.

## Fases

### Phase 1: Contexto e guardrail local
**Status:** complete

- [x] Inspecionar branches, tags, workflows e estado local.
- [x] Registrar a convenção `release/X.Y.Z` e a dependência do CI existente.
- [x] Criar validação local de origem/destino com permissões mínimas.
- [x] Validar YAML com actionlint e revisar diff.

### Phase 2: Estudo e matriz de controles
**Status:** complete

- [x] Documentar a análise completa do workflow de referência.
- [x] Separar controles de workflow, rulesets, permissões e checks obrigatórios.
- [x] Definir testes positivos/negativos e integração com o card de CI.

### Phase 3: Governança de release
**Status:** in_progress

- [x] Propor validação de commits, SemVer, tags e releases.
- [x] Adicionar validação local do título Conventional Commit.
- [x] Submeter arquitetura e rollout para aprovação.

### Phase 4: Publicação controlada
**Status:** pending

- [ ] Implementar somente após autorização específica.
- [ ] Configurar proteções administrativas somente após autorização específica.

## Erros encontrados

- A primeira execução do inicializador recebeu a variável no mesmo comando e resolveu caminho vazio; corrigida exportando `PWF_SKILL_DIR` antes da execução.
