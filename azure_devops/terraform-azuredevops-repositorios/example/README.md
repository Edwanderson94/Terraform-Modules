## Exemplo Terragrunt para Azure Repos

Este exemplo mostra como consumir o modulo `terraform-azuredevops-repositorios` para criar e renomear repositorios no Azure DevOps.

O ponto principal e manter a chave do mapa `repositories` estavel. Para renomear um repositorio ja gerenciado, altere apenas o campo `name` e preserve a chave logica, como `aws`, `oci`, `azure` ou `gcp`.

```hcl
# Inclui o arquivo terragrunt.hcl do diretorio raiz
include {
  path = find_in_parent_folders()
}

terraform {
  source = get_env(
    "TG_AZURE_DEVOPS_REPOSITORIES_MODULE_SOURCE",
    "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/terraform-azuredevops-repositorios?ref=develop"
  )
}

locals {
  repository_names = {
    aws   = "cloud-aws-infra"
    oci   = "cloud-oci-infra"
    azure = "cloud-azure-infra"
    gcp   = "cloud-gcp-infra"
  }

  repository_default_branches = {
    aws   = "main"
    oci   = "develop"
    azure = "uat"
    gcp   = "main"
  }

  repositories = {
    for key, name in local.repository_names : key => {
      name           = name
      default_branch = local.repository_default_branches[key]
    }
  }
}

inputs = {
  project_name          = "nome-do-seu-projeto"
  org_service_url       = get_env("AZDO_ORG_SERVICE_URL", "https://dev.azure.com/nome-da-sua-organizacao")
  personal_access_token = get_env("AZDO_PERSONAL_ACCESS_TOKEN")
  repositories          = local.repositories
}
```

### Acoes suportadas

- Criar repositorios no Azure DevOps.
- Alterar o nome de repositorios gerenciados mantendo a mesma chave logica no mapa `repositories`.
- Definir a branch padrao por repositorio.

### Variaveis esperadas em pipeline

- `AZDO_ORG_SERVICE_URL`: URL da organizacao Azure DevOps.
- `AZDO_PERSONAL_ACCESS_TOKEN`: PAT usado pelo provider Azure DevOps.
- `TG_AZURE_DEVOPS_REPOSITORIES_MODULE_SOURCE`: source opcional do modulo. Use para apontar para checkout local do repo `Terraform-Modules` em pipelines multi-repo.

Em pipelines produtivos, prefira apontar o source para uma tag ou commit imutavel do repo `Terraform-Modules`.
