<!-- BEGIN_TF_DOCS -->
### Repositório Módulo terraform-aws-secretmanager

Bem-vindo à documentação deste repositório de módulos Terraform. O objetivo deste projeto é criar módulos para uso pessoal, mas também torná-los disponíveis para que outros colaboradores da comunidade possam utilizá-los e contribuir para o seu aprimoramento.

<p>
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License" />
</p>

![EdevOps-Logo](https://i.imgur.com/LVpNbS0.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/5.80.0/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secret_version](https://registry.terraform.io/providers/hashicorp/aws/5.80.0/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_recovery_window_in_days"></a> [default\_recovery\_window\_in\_days](#input\_default\_recovery\_window\_in\_days) | Tempo padrão de recuperação (em dias) para segredos | `number` | `7` | no |
| <a name="input_recovery_windows"></a> [recovery\_windows](#input\_recovery\_windows) | Mapa opcional com tempos de recuperação (em dias) para cada segredo | `map(number)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | Região da AWS para os recursos | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Mapa de secrets e seus valores | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_arns"></a> [secret\_arns](#output\_secret\_arns) | n/a |
| <a name="output_secret_ids"></a> [secret\_ids](#output\_secret\_ids) | n/a |

### Contribuição

Contribuições são muito bem-vindas! Se você deseja colaborar, siga as instruções abaixo:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!

## Autores

- [@Edwanderson94](https://github.com/Edwanderson94)

### Considerações Finais

A maior motivação para a criação desses módulos foi a jornada de aprendizado e experiência que adquiri ao longo da minha trajetória profissional. Meu objetivo é compartilhar esse conhecimento, oferecendo módulos utilizando Terraform, com o intuito de proporcionar maior agilidade e eficiência aos projetos de outros profissionais.
<!-- END_TF_DOCS -->