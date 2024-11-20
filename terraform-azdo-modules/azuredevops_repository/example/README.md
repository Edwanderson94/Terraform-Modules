<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 1.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azuredevops_repository"></a> [azuredevops\_repository](#module\_azuredevops\_repository) | github.com/Edwanderson94/Terraform-Modules//terraform-azdo-modules/azuredevops_repository | main |

## Resources

| Name | Type |
|------|------|
| [azuredevops_project.project_infra](https://registry.terraform.io/providers/microsoft/azuredevops/1.4.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_service_url"></a> [org\_service\_url](#input\_org\_service\_url) | URL da sua organization no Azure DevOps | `string` | `"https://dev.azure.com/<SUA-ORG>"` | no |
| <a name="input_personal_access_token"></a> [personal\_access\_token](#input\_personal\_access\_token) | PAT de acesso a sua organization no Azure DevOps | `string` | `""` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Mapa de repositórios a serem criados, com os nomes e branches padrões | <pre>map(object({<br/>    name           = string<br/>    default_branch = string<br/>  }))</pre> | <pre>{<br/>  "repo-01": {<br/>    "default_branch": "main",<br/>    "name": "repo-01"<br/>  },<br/>  "repo-02": {<br/>    "default_branch": "dev",<br/>    "name": "repo-02"<br/>  },<br/>  "repo-03": {<br/>    "default_branch": "uat",<br/>    "name": "repo-03"<br/>  }<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_version"></a> [module\_version](#output\_module\_version) | n/a |
<!-- END_TF_DOCS -->