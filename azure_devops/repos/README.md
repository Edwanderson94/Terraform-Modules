# terraform-azuredevops-repositorios

Modulo Terraform para criar e renomear repositorios no Azure DevOps.

## Acoes suportadas

- Criar repositorios em um projeto Azure DevOps existente.
- Alterar o nome de repositorios ja gerenciados pelo Terraform.
- Criar branches declaradas em `repository_branches`.
- Renomear branches por repositorio com `repository_branch_renames`.
- Deletar branches por repositorio com `repository_branches_to_delete`.
- Padronizar as branches `develop`, `homolog` e `master`.
- Definir `master` como branch padrao por repositorio.
- Expor as URLs dos repositorios gerenciados.

## Como renomear repositorios com seguranca

O modulo usa `for_each` sobre o mapa `repositories`. A chave do mapa e o endereco
estavel do recurso no state. Para renomear, preserve a chave e altere apenas
`name`.

```hcl
repositories = {
  gcp = {
    name           = "cloud-gcp-infra"
    default_branch = "master"
  }
}
```

Evite trocar a chave `gcp`, porque isso faria o Terraform entender como outro
recurso.

## Uso com Terragrunt

```hcl
terraform {
  source = get_env(
    "TG_AZURE_DEVOPS_REPOSITORIES_MODULE_SOURCE",
    "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/repos?ref=develop"
  )
}

inputs = {
  project_name          = "Infrastructure"
  org_service_url       = get_env("AZDO_ORG_SERVICE_URL", "https://dev.azure.com/Tecnoform")
  personal_access_token = get_env("AZDO_PERSONAL_ACCESS_TOKEN")

  repositories = {
    aws = {
      name           = "cloud-aws-infra"
      default_branch = "master"
    }
  }

  repository_branches = ["develop", "homolog", "master"]

  repository_branch_renames = {
    aws = {
      main = "master"
    }
  }

  repository_branches_to_delete = {
    azure = ["uat"]
  }
}
```

Em pipelines produtivos, prefira usar uma tag ou commit imutavel no `source`, ou
aponte `TG_AZURE_DEVOPS_REPOSITORIES_MODULE_SOURCE` para um checkout controlado
do repo `Terraform-Modules`.

## Inputs

| Nome | Tipo | Descricao |
| --- | --- | --- |
| `project_name` | `string` | Nome do projeto Azure DevOps. |
| `org_service_url` | `string` | URL da organizacao Azure DevOps. |
| `personal_access_token` | `string` | PAT do Azure DevOps. Valor sensivel. |
| `repositories` | `map(object)` | Mapa de repositorios com chave logica estavel, nome e branch padrao. |
| `repository_branches` | `list(string)` | Branches que devem existir em todos os repositorios. |
| `repository_branch_renames` | `map(map(string))` | Branches a renomear por repositorio. |
| `repository_branches_to_delete` | `map(list(string))` | Branches a deletar por repositorio. |

## Outputs

| Nome | Descricao |
| --- | --- |
| `module_version` | Versao interna do modulo. |
| `repository_branches` | Branches padronizadas nos repositorios gerenciados. |
| `repository_urls` | URLs dos repositorios gerenciados, indexadas pela chave logica. |

## Requisitos

- Terraform `>= 1.0, < 2.0`.
- Provider `microsoft/azuredevops` `1.4.0`.
- Projeto Azure DevOps ja existente.
