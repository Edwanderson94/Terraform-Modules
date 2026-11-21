# ADR-001 — Estratégia inicial de validação

## Status

Accepted for Passo 1; evolução futura pendente de gate humano.

## Decisão

Começar com um workflow pequeno e completo de formatação (`terraform fmt`) em
PRs e na `master`, sem credentials, state ou providers remotos.

## Motivo

É determinístico, barato, cobre todos os módulos e reduz o risco de introduzir
uma CI que execute efeitos colaterais. Init/validate, lint e scanners exigem
decisões adicionais sobre exemplos, providers e plugins.

## Consequências

O MVP não cobre ainda contratos Terraform, lint ou segurança IaC. Essas lacunas
estão explicitamente registradas no roadmap e não devem ser mascaradas como
aceitação completa do card.
