# Exemplo OCI

Exemplo compatível com a release `1.4.2`. O módulo cria somente o bucket; o
backend, o state de bootstrap e a recuperação devem existir separadamente.

Este exemplo usa o módulo local (`../`) para facilitar `init` e `validate` sem
publicar uma nova versão. Configure profile, região, compartment e nome por
`TF_VAR_*` ou por um arquivo local ignorado pelo Git. Não informe credenciais
Terraform: o provider lê o profile do arquivo `~/.oci/config`.

Validação sem acesso ao backend ou criação de recursos:

```bash
terraform init -backend=false
terraform validate
```

Não rode `apply` sem confirmar conta, região, compartment, state, existência do
bucket e um plano revisado. O módulo aplica `prevent_destroy`.
