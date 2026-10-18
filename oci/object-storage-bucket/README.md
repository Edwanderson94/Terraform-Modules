# OCI Object Storage Bucket

Módulo Terraform reutilizável para criar um bucket OCI com defaults privados e
proteção contra exclusão acidental. Ele cria somente um bucket no compartment
informado; não cria compartment, IAM policy, chaves KMS, backend, state bucket
auxiliar ou objetos.

## Arquitetura e defaults

- Resolve o namespace Object Storage pelo `compartment_id`.
- Cria bucket `Standard`, `NoPublicAccess`, com versionamento habilitado.
- Mantém eventos de objetos e auto-tiering desabilitados.
- Aplica `freeform_tags` opcionais.
- `prevent_destroy = true` evita exclusão acidental pelo Terraform.
- Provider e autenticação são configurados pelo consumidor, nunca pelo módulo.

## Uso com Terraform

```hcl
module "state_bucket" {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//oci/object-storage-bucket?ref=<tag-ou-commit-imutavel>"

  compartment_id = var.compartment_id
  name           = "terraform-state"
  freeform_tags = {
    ManagedBy = "Terraform"
    Purpose   = "terraform-state"
  }
}
```

Configure o provider `oracle/oci` no consumidor e autentique com profile OCI
local, variáveis de ambiente ou identidade federada/instância, conforme o
ambiente. Não salve chaves, tokens ou arquivos de configuração OCI no repositório.

## Uso com Terragrunt

O exemplo demonstra o contrato usado pela camada `terraform-state/oci/state-bucket`.
Fixe o source em tag ou commit publicado e imutável:

```hcl
include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::https://github.com/Edwanderson94/Terraform-Modules.git//oci/object-storage-bucket?ref=<tag-ou-commit-imutavel>"
}

inputs = {
  compartment_id = get_env("OCI_COMPARTMENT_ID")
  name           = get_env("OCI_TF_STATE_BUCKET", "terraform-state")
  freeform_tags = {
    ManagedBy = "Terraform"
    Purpose   = "terraform-state"
  }
}
```

### Bootstrap e state

O módulo do bucket não pode depender do backend remoto que o próprio bucket
viabiliza. Mantenha o state de bootstrap em backend independente e durável,
com backup e recuperação documentados; não use um runner efêmero como único
local de state. Só migre o state para o bucket após confirmar bucket, namespace,
compartment, acesso, locking e rollback.

Antes do primeiro apply, verifique se já existe um bucket com o mesmo nome no
namespace. Se ele já existir, não tente criá-lo novamente: confira propriedade e
state existente e avalie importação.

## Inputs

| Nome | Tipo | Obrigatório | Padrão | Descrição |
| --- | --- | --- | --- | --- |
| `compartment_id` | `string` | sim | — | OCID do compartment de destino. |
| `name` | `string` | sim | — | Nome do bucket, único no namespace. |
| `freeform_tags` | `map(string)` | não | `{}` | Tags livres a aplicar. |

## Outputs

| Nome | Descrição |
| --- | --- |
| `bucket_id` | OCID do bucket retornado pelo provider. |
| `name` | Nome do bucket. |
| `namespace` | Namespace OCI. |
| `terraform_id` | ID usado pelo provider para gerenciamento/importação. |

## Importação e proteção de exclusão

O provider aceita importar um bucket pelo identificador
`n/<namespace>/b/<nome>`. O endereço Terraform do recurso é
`module.state_bucket.oci_objectstorage_bucket.this` quando chamado pelo exemplo
acima; adapte ao nome real do módulo consumidor. Consulte a [documentação oficial
do provider](https://registry.terraform.io/providers/oracle/oci/8.12.0/docs/resources/objectstorage_bucket)
antes de importar.

`prevent_destroy` é intencional para proteger buckets com state/objetos. Uma
remoção requer mudança explícita de código para retirar a proteção, análise das
versões dos objetos, backup/recuperação e aprovação operacional. Não remova essa
proteção apenas para contornar um erro de plan.

## Requisitos e validação

- Terraform `>= 1.0, < 2.0`.
- Provider `oracle/oci ~> 8.0`.
- A identidade precisa ler o namespace e gerenciar buckets no compartment.
- O consumidor deve manter backend e recuperação independentes para o state de
  bootstrap.

Valide o exemplo sem consultar ou alterar recursos OCI:

```bash
terraform -chdir=example init -backend=false
terraform -chdir=example validate
```

Essas validações não substituem `plan`; não faça apply sem revisar o plano e
confirmar conta, região, compartment, nome e state alvo.
