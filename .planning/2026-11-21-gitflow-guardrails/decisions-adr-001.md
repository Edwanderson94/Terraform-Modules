# ADR-001 — Guardrail separado da CI Terraform

## Contexto

O repositório já possui CI de formatação, validação, lint e segurança. O workflow de referência também contém publicação de tags, mas essa permissão tem risco e ciclo de aprovação diferente.

## Decisão

Manter o guardrail de fluxo em workflow próprio e deixar a CI Terraform responsável pela qualidade do código. A publicação de tags/releases será adicionada somente após a política administrativa e os testes de promoção estarem aprovados.

## Consequências

- Checks ficam independentes e auditáveis.
- Evita duplicação de `terraform validate` e scans.
- Exige configuração posterior de required checks para transformar falhas em bloqueio preventivo.
- Exige uma etapa explícita de publicação com `contents: write`.
