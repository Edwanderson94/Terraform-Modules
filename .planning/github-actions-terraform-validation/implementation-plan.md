# Plano incremental

| Passo | Entrega | Critério local | Gate |
| --- | --- | --- | --- |
| 1 | Workflow de fmt e guardrails básicos | actionlint, fmt, diff check | Concluído localmente |
| 2 | init/validate dos exemplos | init offline e validate | Implementado; validar local/remoto |
| 3 | TFLint | lint recursivo | Implementado no workflow |
| 4 | Estratégia incremental/matrix | matrix de exemplos | Implementado no workflow |
| 5 | terraform test seguro | mocks e testes não destrutivos | Pendente: não há testes existentes |
| 6 | Trivy ou Checkov | Trivy config HIGH/CRITICAL | Implementado no workflow |
| 7 | terraform-docs | documentação consistente | Pendente: avaliar divergências |
| 8 | Governança/GitFlow | checks obrigatórios avaliados | Aguardar autorização administrativa |

Cada passo exige três marcos independentes: implementação, validação estática
local e validação real no GitHub Actions.
