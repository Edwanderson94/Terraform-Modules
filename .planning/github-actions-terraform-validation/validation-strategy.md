# Estratégia de validação

## Passo 1

```text
actionlint .github/workflows/terraform-format.yml
terraform fmt -check -recursive -diff
git diff --check
```

O check remoto permanece pendente até o workflow ser executado pelo GitHub.

## Passos posteriores

Para cada exemplo aplicável: `terraform init -backend=false` e `terraform
validate`, sem backend remoto. O resultado deve ser separado entre falha de
contrato HCL e ausência de credenciais/provider configuration. Nenhuma falha
deve ser contornada com `apply`, state remoto ou secrets administrativos.
