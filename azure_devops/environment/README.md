# Azure DevOps environment

Módulo reutilizável para criar e gerenciar um Environment em um projeto Azure
DevOps existente.

O módulo gerencia somente o Environment. O consumidor permanece responsável por:

- configurar o provider e a autenticação;
- resolver o `project_id`;
- configurar Environment Resources, Approvals & Checks e autorizações de pipeline;
- revisar e aplicar o plano Terraform.

## Uso

```hcl
module "production_environment" {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//azure_devops/environment?ref=<tag-ou-commit-imutavel>"

  project_id      = data.azuredevops_project.platform.id
  name            = "production"
  description     = "Environment de produção"
}
```

## Inputs

| Nome | Tipo | Obrigatório | Padrão |
| --- | --- | --- | --- |
| `project_id` | `string` | sim | — |
| `name` | `string` | sim | — |
| `description` | `string` | não | `null` |

## Outputs

| Nome | Descrição |
| --- | --- |
| `id` | ID do Environment |
| `name` | Nome do Environment |
| `project_id` | ID do projeto associado |

## Importação

Para adotar um Environment existente, use o formato `<project_id>/<environment_id>`:

```bash
terraform import module.production_environment.azuredevops_environment.this "<project-id>/<environment-id>"
```

Após importar, execute `terraform plan` e ajuste a configuração antes de aplicar
qualquer mudança. A importação não configura automaticamente Approvals & Checks.

## Segurança e operações

- O módulo não contém bloco `provider` nem credenciais.
- `prevent_destroy = true` é fixado no módulo para reduzir risco em Environments
  persistentes. Para destruir deliberadamente um Environment, faça uma alteração
  deliberada no módulo, revise o plano e siga o processo de aprovação do consumidor.
- Fixe o `source` em tag ou commit imutável em ambientes compartilhados.

## Requisitos

- Terraform `>= 1.0, < 2.0`.
- Provider `microsoft/azuredevops >= 1.4.0, < 2.0.0`.
