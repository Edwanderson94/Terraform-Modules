# Inventário do repositório

## Estado atual

- Branch observada: `feature/azure-devops-environment`.
- Branch principal publicada: `master`; release atual observada: `v1.4.3`.
- Não havia `.github/workflows/` antes do Passo 1.
- Há alterações locais preexistentes; elas foram preservadas.

## Módulos e providers

| Área | Módulos | Provider/versão observada |
| --- | --- | --- |
| AWS | `iam`, `secret-manager` | `hashicorp/aws` `5.80.0` |
| Azure DevOps | `repos`, `pipelines`, `azuredevops_variablegroup`, `environment` | `microsoft/azuredevops` `1.4.0` ou `>= 1.4.0, < 2.0.0`; `hashicorp/null ~> 3.2` em `repos` |
| OCI | `object-storage-bucket` | `oracle/oci ~> 8.0` |

Existem 5 exemplos: AWS IAM, Azure DevOps variable group, environment,
pipelines e OCI object storage bucket. Não foram encontrados testes `terraform
test`, configuração de TFLint, Checkov, Trivy ou terraform-docs.

## Particularidades para CI

- Providers são resolvidos nos exemplos; a validação deve usar `init -backend=false`.
- Alguns módulos legados mantêm provider/configuração no próprio módulo.
- `azure_devops/repos` contém lógica com `null_resource` e chamadas REST; não deve
  ser executado contra ambientes na CI de validação.
- OCI e Azure DevOps podem exigir variáveis de provider mesmo para validação de
  schema; a CI deve usar apenas placeholders e nunca credenciais reais.
- O módulo OCI e alguns módulos Azure DevOps possuem `prevent_destroy`; a CI não
  deve executar operações de state ou provisionamento.
