# Integração com a CI Terraform

O card relacionado de CI (#14) está concluído e o workflow `.github/workflows/terraform-format.yml` já executa:

- `terraform fmt` e whitespace;
- `terraform validate` nos cinco exemplos;
- TFLint recursivo;
- Trivy para IaC com severidade alta/crítica.

O guardrail de GitFlow deve permanecer responsável apenas por fluxo, origem e nomenclatura. Não deve fazer checkout, init, validate, lint ou scan novamente. Ambos podem executar em paralelo; o ruleset deve exigir os checks de qualidade e o guardrail antes da promoção.

## Checks requeridos sugeridos

1. `Validate branch flow` para PRs de trabalho/release.
2. `Terraform format`.
3. Todos os jobs relevantes da CI de Terraform, conforme os nomes publicados pelo workflow.

A configuração dos required checks é administrativa e não será alterada nesta etapa.
