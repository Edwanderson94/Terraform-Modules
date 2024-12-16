
## Terragrunt para Gerenciamento de Segredos na AWS

Este exemplo apresenta um código **Terragrunt** que utiliza um módulo **Terraform** para criar e gerencia o recurso **Azure Repos**.

<p>
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License" />
</p>

![EdevOps-Logo](https://i.imgur.com/LVpNbS0.png)


### Pré-requisito

Para executar este código, é necessário que o Terragrunt esteja configurado no sistema operacional. O Terragrunt é uma ferramenta que estende o Terraform, facilitando o uso de módulos e a gestão de configurações em múltiplos ambientes.


### Utilização e Exemplo

O código utiliza o Terragrunt para encapsular e gerenciar a chamada ao módulo Terraform.

```hcl

# Inclui o arquivo terragrunt.hcl do diretório raiz
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//terraform-azdo-modules/azuredevops_repository?ref=<versao-modulo>>"
}

inputs = {
  project_name          = "nome-do-seu-projeto"
  org_service_url       = "https://dev.azure.com/nome-do-seu-projeto"
  personal_access_token = "seu-token-pat-do-azure-devops"

  repositories = {
    "repo-01" = {
      name           = "repo-01"
      default_branch = "main"
    },

    "repo-02" = {
      name           = "repo-02"
      default_branch = "dev"
    },

    "repo-03" = {
      name           = "repo-03"
      default_branch = "uat"
    }
  }
}

```

### Stack utilizada

- Infraestrutura como Código (IaC): Terraform, Terragrunt
- Cloud Provider: Azure
- Serviço: Azure DevOps
- Recurso: Azure Repos
- Repositório do Módulo: GitHub 

### Referências
 - [Gruntwork.oi - Terragrunt](https://terragrunt.gruntwork.io/docs/)
 - [HashCorp - Terraform Azure DevOps](https://registry.terraform.io/providers/microsoft/azuredevops/latest)

### Contribuindo

Contribuições são sempre bem-vindas! Se você deseja colaborar, siga os seguintes passos:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!


### Autores

- [@Edwanderson94](https://github.com/Edwanderson94)


### Considerações Finais

Neste projeto, aprofundei meus conhecimentos em Terraform e Terragrunt, aplicando-os ao gerenciamento de recursos no Azure Repos. Durante o desenvolvimento, trabalhei com conceitos importantes, como a configuração de branches, permitindo definir automaticamente a branch padrão logo após a criação de um repositório no Azure DevOps.

Essa abordagem simplifica o gerenciamento de repositórios e contribui para uma configuração mais eficiente e padronizada.