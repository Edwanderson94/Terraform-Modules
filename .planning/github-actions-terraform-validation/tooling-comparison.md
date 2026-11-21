# Comparação de ferramentas

| Ferramenta | Papel | MVP | Decisão |
| --- | --- | --- | --- |
| `terraform fmt` | Formatação HCL | Sim | Passo 1 |
| `terraform init -backend=false` + `validate` | Schema e contratos | Não neste passo | Passo 2, por exemplo suportado |
| TFLint | Lint Terraform/provider | Não | Avaliar após baseline e fixar plugins |
| Trivy ou Checkov | IaC/segurança | Não | Escolher no estudo do Passo 6; evitar sobreposição inicial |
| `terraform test` | Testes nativos | Não | Exige confirmar mocks e ausência de efeitos reais |
| terraform-docs | Consistência de README | Não | Evolução, pois READMEs atuais têm estilos distintos |
| actionlint | Sintaxe e expressões de workflow | Sim | Validar localmente no Passo 1 |

TFLint é a evolução natural para qualidade Terraform. Trivy/Checkov devem ser
comparados em um passo separado, pois ambos ampliam regras e ruído operacional.
