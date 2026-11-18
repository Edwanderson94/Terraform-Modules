# Releases

Este catálogo resume as versões públicas do `Terraform-Modules`. Cada versão
é publicada como uma GitHub Release ligada a uma tag imutável. Para consumidores,
prefira sempre uma tag em vez de `master` ou de uma branch de desenvolvimento.

## Catálogo

| Versão | Tag | Data | Destaques |
| --- | --- | --- | --- |
| [1.4.3](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/v1.4.3) | `v1.4.3` | 2026-11-17 | Preservação segura de branches de repositórios, proteção da inicialização existente, backend OCI gerado pelo Terragrunt, módulo AWS IAM e renomeação do módulo AWS Secrets Manager. |
| [1.4.2](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/1.4.2) | `1.4.2` | 2026-10-17 | Documentação de release, orientações de consumo e organização operacional do repositório. |
| [1.4.1](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/1.4.1) | `1.4.1` | 2026-10-17 | Renomeação do módulo de variable groups do Azure DevOps. |
| [1.4.0](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/1.4.0) | `1.4.0` | 2026-10-17 | Módulo de variable groups do Azure DevOps, módulo de pipelines e módulo OCI Object Storage Bucket. |
| [1.3.2](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/v1.3.2) | `v1.3.2` | 2026-06-29 | Aguarda a inicialização de repositórios Azure DevOps por mais tempo antes de concluir a execução. |
| [1.3.1](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/v1.3.1) | `v1.3.1` | 2026-06-29 | Inicialização de repositórios Azure DevOps vazios. |
| [1.3.0](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/v1.3.0) | `v1.3.0` | 2026-06-28 | Evolução do módulo de repositórios Azure DevOps. |
| [1.0.0](https://github.com/Edwanderson94/Terraform-Modules/releases/tag/v1.0.0) | `v1.0.0` | 2024-11-20 | Lançamento inicial do módulo de repositórios Azure DevOps, com exemplos e documentação de consumo. |

## Como escolher uma versão

Use a tag exata no consumidor:

```hcl
module "azuredevops_repositories" {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/repos?ref=v1.4.3"
}
```

Antes de atualizar uma versão:

1. leia as notas da GitHub Release correspondente;
2. revise o contrato do módulo e o `README.md` do componente;
3. execute `terraform init -backend=false` e `terraform validate` no exemplo;
4. gere e revise o `terraform plan` no projeto consumidor;
5. aplique a atualização somente após a aprovação do plano.

## Convenção de publicação

As tags são a referência imutável de consumo. A publicação segue o fluxo:

```text
alteração → branch de trabalho → validação → release branch → master → tag → GitHub Release
```

As tags históricas usam tanto o formato `v1.4.3` quanto `1.4.2`. Novas versões
devem usar o formato `v<major>.<minor>.<patch>` para manter a convenção única.
