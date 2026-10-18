# Exemplo de uso

Exemplo compatível com a release `1.4.2`; fixe o módulo em tag ou commit
imutável ao consumi-lo em pipeline protegida.

O exemplo consulta um projeto e um repositório existentes, então chama o módulo
localmente. Configure `AZDO_ORG_SERVICE_URL`, `AZDO_PERSONAL_ACCESS_TOKEN` e
variáveis Terraform (`TF_VAR_*`) no ambiente ou em um secret store; não grave
tokens em arquivos `.tfvars`.

Validação local sem modificar Azure DevOps:

```bash
terraform init -backend=false
terraform validate
```

Um `plan` deste exemplo consulta a organização. Antes de aplicar, revise e
aprove explicitamente o plano; a criação da definição é uma alteração remota.
