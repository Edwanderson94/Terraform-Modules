
## Terragrunt para Gerenciamento de Segredos na AWS

Este exemplo apresenta um código **Terragrunt** que utiliza um módulo **Terraform** para criar e gerenciar segredos no **AWS Secrets Manager**. A solução foi projetada para simplificar a configuração e garantir o gerenciamento seguro e eficiente de segredos, permitindo a criação de múltiplos segredos no mesmo código com facilidade.

<p>
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License" />
</p>

![EdevOps-Logo](https://i.imgur.com/LVpNbS0.png)


### Pré-requisito

É necessário configurar o AWS CLI no sistema operacional utilizando o comando `aws configure`. Essa etapa é fundamental para fornecer as credenciais de autenticação da AWS, pois o módulo depende do **provider AWS** para funcionar corretamente.

### Utilização e Exemplo

O código utiliza o Terragrunt para encapsular e gerenciar a chamada ao módulo Terraform.

```hcl

terraform {
  source = "github.com/Edwanderson94/Terraform-Modules//aws/terraform-aws-secretmanager?ref=main"
}

inputs = {
  region      = "sa-east-1"
  secrets = {
    "azuredevops/terraform/" = "password123"
  }

  recovery_windows = {
    "azuredevops/terraform/" = 8
  }

  default_recovery_window_in_days = 7
}

```

### Stack utilizada

- **Infraestrutura como Código (IaC):** Terraform, Terragrunt  
- **Cloud Provider:** AWS  
- **Gerenciamento de Segredos:** AWS Secrets Manager  
- **Gerenciamento de Módulos:** Repositórios no GitHub  

### Referências

 - [AWS - Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html)
 - [Gruntwork.oi - Terragrunt](https://terragrunt.gruntwork.io/docs/)
 - [HashCorp - Terraform Secret Manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret)


### Contribuindo

Contribuições são sempre bem-vindas! Se você deseja colaborar, siga os seguintes passos:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!


### Autores

- [@Edwanderson94](https://github.com/Edwanderson94)


### Considerações Finais

Neste projeto, tive a oportunidade de aprofundar meus conhecimentos em **Terraform** e **Terragrunt**, aplicando-os ao gerenciamento de segredos na AWS por meio do **AWS Secrets Manager**. Durante o desenvolvimento, explorei conceitos como configuração de regiões, gerenciamento de janelas de recuperação e provisionamento de múltiplos segredos, o que me permitiu criar um fluxo mais eficiente e seguro.