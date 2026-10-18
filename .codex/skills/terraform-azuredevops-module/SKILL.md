---
name: terraform-azuredevops-module
description: "Cria, revisa, valida e documenta módulos Terraform reutilizáveis para recursos Azure DevOps neste repositório."
---

# Skill — módulo Terraform para Azure DevOps

## Quando usar

Use ao criar ou alterar módulos Terraform sob `azure_devops/`, ou ao integrar
um desses módulos em um stack consumidor.

## Fluxo

1. Leia o `AGENTS.md` e os steerings aplicáveis no repositório consumidor e em
   `../steering/terraform-modules.md`.
2. Inspecione o estado do Git, módulos existentes, provider e lockfile antes de
   editar. Não sobrescreva alterações do usuário.
3. Separe responsabilidades: provider/auth, lookup de recursos existentes e
   valores de ambiente ficam no consumidor; o módulo recebe IDs e contrato
   genérico.
4. Crie o módulo com `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`,
   README e exemplo seguros.
5. Confirme o schema da versão fixada do provider. Não use argumentos presentes
   apenas em documentação de versões mais novas.
6. Rode `terraform fmt -check -recursive` e validação com inicialização sem
   backend quando necessário. `validate` não substitui `plan`.
7. Para um consumidor Terragrunt, respeite `root.hcl`, source/version e backend;
   não rode Terraform diretamente se o Terragrunt gera configuração necessária.
8. Apresente o diff, os resultados de validação e os bloqueios. Não aplique
   recursos reais sem aprovação explícita do plano.

## Para o módulo de pipeline

- O projeto e o repositório devem existir e ser resolvidos pelo consumidor.
- O módulo cria apenas uma definição `azuredevops_build_definition` YAML para
  Azure Repos, sem configurar permissões, secrets, variable groups ou pipeline
  environment.
- `ci_trigger.use_yaml = true` deixa o YAML como fonte de triggers. Não force a
  execução inicial na criação.
- Fixe o source consumidor em release/tag/commit imutável antes de uso protegido.

## Saída esperada

Resuma recursos dentro/fora do escopo, inputs/outputs, provider testado, origem
do módulo, comandos executados, riscos, pendências e se houve ou não operação
remota. Nunca alegue provisionamento sem evidência pós-apply.
