# Plano de implementação e rollout

| Etapa | Entrega | Autorização necessária | Estado |
|---|---|---|---|
| 1 | Guardrail local de PR e documentação inicial | Alteração local | Concluída |
| 2 | Testes em PR de validação e rulesets/required checks | Push e alteração GitHub | Pendente |
| 3 | Conventional Commits e SemVer | Push e execução de CI | Pendente |
| 4 | Tag/release pós-merge | Permissão explícita de publicação | Pendente |
| 5 | Evidência operacional e encerramento | Leitura dos checks/releases | Pendente |

Cada etapa deve ter revisão, evidência e aprovação antes da seguinte. O rollback de uma etapa de workflow é feito por reversão via PR; não remover tags ou releases já publicadas.
