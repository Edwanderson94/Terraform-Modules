# Azure DevOps Repositories

Módulo Terraform para gerenciar Azure Repos em um projeto Azure DevOps existente.

Este módulo foi desenhado para ser reutilizável. Configurações específicas de
ambiente, como nomes dos repositórios da sua organização, devem ficar nas live
stacks que consomem o módulo.

## Capacidades

- Criar repositórios Git no Azure DevOps.
- Renomear repositórios mantendo uma chave lógica estável no Terraform state.
- Criar branches padronizadas.
- Renomear branches por repositório.
- Remover branches antigas por repositório.
- Configurar branch padrão por repositório.
- Expor URLs dos repositórios gerenciados.

## Requisitos

| Requisito | Versão |
| --- | --- |
| Terraform | `>= 1.0, < 2.0` |
| Provider `microsoft/azuredevops` | `1.4.0` |
| Provider `hashicorp/null` | `~> 3.2` |

O projeto Azure DevOps deve existir antes da execução.

## Uso

Exemplo Terraform:

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

    terraform_state = {
      name           = "terraform-state"
      default_branch = "master"
    }
  }

  repository_branches = ["develop", "homolog", "master"]
}
```

Exemplo Terragrunt:

```hcl
terraform {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/repos?ref=v1.3.2"
}

inputs = {
  org_service_url       = get_env("AZDO_ORG_SERVICE_URL")
  personal_access_token = get_env("AZDO_PERSONAL_ACCESS_TOKEN")
  project_name          = "Infrastructure"

  repositories = {
    aws = {
      name           = "cloud-aws-infra"
      default_branch = "master"
    }
  }

  repository_branches = ["develop", "homolog", "master"]
}
```

Use tags versionadas no `source`. Evite consumir `develop` ou `master` em
pipelines produtivas.

## Como Renomear Repositórios

O módulo usa `for_each` sobre o mapa `repositories`.

A chave do mapa é a identidade do recurso no Terraform state. O campo `name` é
o nome real do repositório no Azure DevOps.

Para renomear com segurança, mantenha a chave e altere apenas `name`.

```hcl
repositories = {
  gcp = {
    name           = "cloud-gcp-infra"
    default_branch = "master"
  }
}
```

Para renomear:

```hcl
repositories = {
  gcp = {
    name           = "cloud-google-infra"
    default_branch = "master"
  }
}
```

Não altere a chave `gcp` sem necessidade. Trocar a chave faz o Terraform
entender que é outro recurso.

## Como Gerenciar Branches

Branches que devem existir em todos os repositórios:

```hcl
repository_branches = ["develop", "homolog", "master"]
```

Renomear branches por repositório:

```hcl
repository_branch_renames = {
  aws = {
    main = "master"
  }
}
```

Remover branches antigas:

```hcl
repository_branches_to_delete = {
  aws   = ["main"]
  azure = ["uat"]
}
```

O módulo impede a remoção de branches protegidas pela configuração desejada,
como a branch padrão e as branches listadas em `repository_branches`.

## Inputs

| Nome | Tipo | Obrigatório | Descrição |
| --- | --- | --- | --- |
| `org_service_url` | `string` | Sim | URL da organização Azure DevOps. |
| `personal_access_token` | `string` | Sim | PAT usado pelo provider Azure DevOps. Valor sensível. |
| `project_name` | `string` | Sim | Nome do projeto Azure DevOps existente. |
| `repositories` | `map(object({ name = string, default_branch = string }))` | Sim | Repositórios gerenciados, indexados por chave lógica estável. |
| `repository_branches` | `list(string)` | Não | Branches que devem existir em todos os repositórios. Padrão: `["develop", "homolog", "master"]`. |
| `repository_branch_renames` | `map(map(string))` | Não | Mapa de renome de branches por repositório. |
| `repository_branches_to_delete` | `map(list(string))` | Não | Branches antigas que devem ser removidas por repositório. |

## Outputs

| Nome | Descrição |
| --- | --- |
| `module_version` | Versão interna do módulo. |
| `repository_branches` | Branches padronizadas nos repositórios gerenciados. |
| `repository_urls` | URLs dos repositórios gerenciados, indexadas pela chave lógica. |

## Validação Local

```bash
terraform fmt -check
terraform init
terraform validate
```

Para validar o exemplo Terragrunt:

```bash
cd example
terragrunt hcl format --check
```

## Observações

- O módulo usa chamadas auxiliares à API do Azure DevOps para padronizar
  branches.
- O PAT precisa ter permissão para administrar repositórios no projeto alvo.
- Evite hardcode de segredos em live stacks.
- Em pipelines, injete `AZDO_PERSONAL_ACCESS_TOKEN` como secret variable.
