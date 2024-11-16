<!-- BEGIN_TF_DOCS -->
# Repositório Terraform

Bem-vindo à documentação deste repositório Terraform! Este espaço foi criado para compartilhar as implementações realizadas ao longo da minha jornada como DevOps e SRE, explorando o uso dessa poderosa ferramenta de infraestrutura como código.

## Objetivo

Este repositório tem como propósito centralizar módulos, documentações e exemplos práticos relacionados ao uso do Terraform. Aqui você encontrará:

- **Módulos reutilizáveis** para provisionamento de recursos.
- **Guia de comandos** para facilitar o uso do Terraform.
- **Estruturas de implementação** aplicadas em plataformas como:
  - **Azure DevOps**
  - **AWS**

Explore, aprenda e contribua para expandir este repositório com ideias e melhorias!

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 1.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_git_repository.repositories](https://registry.terraform.io/providers/microsoft/azuredevops/1.4.0/docs/resources/git_repository) | resource |
| [azuredevops_project.project_infra](https://registry.terraform.io/providers/microsoft/azuredevops/1.4.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_multiple_repositories"></a> [create\_multiple\_repositories](#input\_create\_multiple\_repositories) | Flag para determinar se múltiplos repositórios devem ser criados | `bool` | `false` | no |
| <a name="input_org_service_url"></a> [org\_service\_url](#input\_org\_service\_url) | n/a | `string` | n/a | yes |
| <a name="input_personal_access_token"></a> [personal\_access\_token](#input\_personal\_access\_token) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Lista de repositórios para criar | <pre>list(object({<br/>    name           = string<br/>    default_branch = string<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_default_branch"></a> [repository\_default\_branch](#output\_repository\_default\_branch) | O branch padrão dos repositórios criados |
| <a name="output_repository_ids"></a> [repository\_ids](#output\_repository\_ids) | IDs dos repositórios criados, associados ao índice e ao nome do repositório |
| <a name="output_repository_names"></a> [repository\_names](#output\_repository\_names) | Nomes dos repositórios criados |

# Considerações Finais

Este repositório foi desenvolvido com o objetivo de oferecer uma infraestrutura mais robusta e escalável, utilizando Terraform de maneira simples e eficiente no universo dos providers. Aqui estão armazenadas estruturas, desenvolvimentos e documentações baseadas em minha experiência prática.

## Licença

Este módulo está licenciado sob [tipo de licença, ex: MIT]. Para mais informações, consulte o arquivo [LICENSE](./LICENSE).

## Contribuição

Contribuições são muito bem-vindas! Se você deseja colaborar, siga as instruções abaixo:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!

---

**Desenvolvido por**
Edwanderson Luiz Pereira
<!-- END_TF_DOCS -->