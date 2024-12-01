<!-- BEGIN_TF_DOCS -->
# Módulo `Terraform-AzureDevOps-Repositório`

Bem-vindo ao módulo Terraform para o Azure DevOps, projetado para facilitar a criação de múltiplos repositórios.

## Objetivo

Este módulo tem como propósito:
- Provisionar múltiplos repositórios no Azure DevOps.
- Configurar a branch padrão (*default branch*) para cada repositório criado.

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

# Considerações Finais

Este módulo foi desenvolvido inicialmente para atender às necessidades dos meus projetos e estudos pessoais. No entanto, sua estrutura foi pensada de forma simples e funcional, permitindo a criação de múltiplos repositórios simultaneamente. Espero que este módulo também seja útil para outros desenvolvedores e profissionais que compartilhem da mesma necessidade.

## Licença

Este módulo está licenciado sob MIT. Para mais informações, consulte o arquivo [LICENSE](./LICENSE).

## Contribuição

Contribuições são muito bem-vindas! Se você deseja colaborar, siga as instruções abaixo:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!

---

**Desenvolvido por**
Edwanderson Luiz Pereira
<!-- END_TF_DOCS -->