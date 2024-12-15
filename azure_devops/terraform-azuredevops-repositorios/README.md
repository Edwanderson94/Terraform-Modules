<!-- BEGIN_TF_DOCS -->
### Repositório Módulos Terraform

Bem-vindo à documentação deste repositório de módulos Terraform. O objetivo deste projeto é criar módulos para uso pessoal, mas também torná-los disponíveis para que outros colaboradores da comunidade possam utilizá-los e contribuir para o seu aprimoramento.

<p>
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License" />
</p>

![EdevOps-Logo](https://i.imgur.com/LVpNbS0.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0, < 2.0 |
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
| <a name="input_org_service_url"></a> [org\_service\_url](#input\_org\_service\_url) | URL da sua organization no Azure DevOps | `string` | n/a | yes |
| <a name="input_personal_access_token"></a> [personal\_access\_token](#input\_personal\_access\_token) | PAT de acesso a sua organization no Azure DevOps | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto no Azure DevOps | `any` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Lista de repositórios a serem criados | <pre>map(object({<br/>    name           = string<br/>    default_branch = string<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_version"></a> [module\_version](#output\_module\_version) | Versão do módulo |
| <a name="output_repository_urls"></a> [repository\_urls](#output\_repository\_urls) | Lista de URLs dos repositórios criados |

### Contribuição

Contribuições são muito bem-vindas! Se você deseja colaborar, siga as instruções abaixo:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!

## Autores

- [@Edwanderson94](https://github.com/Edwanderson94)

### Considerações Finais

A maior motivação para a criação desses módulos foi a jornada de aprendizado e experiência que adquiri ao longo da minha trajetória profissional. Meu objetivo é compartilhar esse conhecimento, oferecendo módulos para Azure DevOps utilizando Terraform, com o intuito de proporcionar maior agilidade e eficiência aos projetos de outros profissionais.
<!-- END_TF_DOCS -->