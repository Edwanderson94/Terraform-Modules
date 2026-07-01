# Terraform Modules

Catálogo de módulos Terraform reutilizáveis para provisionar e padronizar
recursos de infraestrutura.

Este repositório foi pensado como um produto: os módulos devem ser genéricos,
documentados, versionados por tags e consumidos por outros repositórios de live
stacks.

```text
Terraform-Modules = módulos reutilizáveis
Terraform         = live stacks que consomem os módulos
```

## Objetivo

Centralizar módulos Terraform que possam ser usados em projetos pessoais,
ambientes corporativos e, futuramente, por outras pessoas da comunidade.

Cada módulo deve ter:

- contrato claro de inputs e outputs;
- exemplo funcional;
- documentação de uso;
- versionamento semântico;
- changelog;
- validação com `terraform fmt` e `terraform validate`.

## Módulos Disponíveis

| Plataforma | Módulo | Caminho | Status |
| --- | --- | --- | --- |
| Azure DevOps | Repositórios Git | `azure_devops/repos` | Funcional |
| Azure DevOps | Pipelines | `azure_devops/pipelines` | Em estruturação |
| AWS | Secrets Manager | `aws/terraform-aws-secretmanager` | Funcional |

## Como Consumir Um Módulo

Use sempre uma tag versionada no `source`.

Exemplo:

```hcl
module "azuredevops_repositories" {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/repos?ref=v1.3.2"

  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
  project_name          = var.project_name

  repositories = {
    aws = {
      name           = "cloud-aws-infra"
      default_branch = "master"
    }
  }
}
```

Evite consumir diretamente branches mutáveis, como `develop` ou `master`, em
pipelines produtivas.

## Estrutura Recomendada de Módulo

Cada módulo deve seguir este padrão:

```text
module-name/
├── README.md
├── CHANGELOG.md
├── versions.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── examples/
```

Quando o provider precisar de dados auxiliares, também podem existir arquivos
como:

```text
data.tf
locals.tf
```

## Azure DevOps

Os módulos Azure DevOps ficam em:

```text
azure_devops/
```

Estrutura desejada:

```text
azure_devops/
├── README.md
├── repos/
├── pipelines/
├── variable_groups/
├── service_connections/
├── environments/
└── permissions/
```

### `azure_devops/repos`

Módulo para gerenciar Azure Repos.

Principais capacidades:

- criar repositórios;
- renomear repositórios mantendo uma chave lógica estável;
- criar branches padronizadas;
- renomear branches;
- remover branches antigas;
- configurar branch padrão;
- expor URLs dos repositórios.

Documentação específica:

```text
azure_devops/repos/README.md
```

## AWS

Os módulos AWS ficam em:

```text
aws/
```

### `aws/terraform-aws-secretmanager`

Módulo para criação e gerenciamento de secrets no AWS Secrets Manager.

Documentação específica:

```text
aws/terraform-aws-secretmanager/README.md
```

## Versionamento

Este repositório segue versionamento semântico:

```text
MAJOR.MINOR.PATCH
```

Exemplos:

```text
v1.3.2
v1.4.0
v2.0.0
```

Use:

- `PATCH` para correções compatíveis;
- `MINOR` para novas funcionalidades compatíveis;
- `MAJOR` para mudanças incompatíveis.

## Fluxo de Desenvolvimento

Fluxo recomendado:

```text
feature/* -> develop -> master -> tag
```

Antes de publicar uma tag:

```bash
terraform fmt -recursive
terraform validate
```

Quando possível, valide também os exemplos do módulo.

## Boas Práticas

- Módulos devem ser genéricos e reutilizáveis.
- Configurações específicas de ambiente não devem ficar no módulo.
- Segredos não devem ser hardcoded.
- Inputs sensíveis devem usar `sensitive = true`.
- Outputs não devem expor segredos.
- Live stacks devem consumir módulos por tag.
- Mudanças importantes devem ser documentadas no `CHANGELOG.md`.

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo
[`LICENSE`](./LICENSE) para mais detalhes.

## Autor

- [@Edwanderson94](https://github.com/Edwanderson94)
