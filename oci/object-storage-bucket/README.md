# OCI Object Storage Bucket

Modulo reutilizavel para criar um bucket OCI privado, na camada Standard, com
versionamento habilitado e protecao contra destruicao acidental.

O modulo nao configura credenciais, provider ou backend. O chamador deve
fornece-los de forma segura.

## Entradas

| Nome | Descricao |
| --- | --- |
| `compartment_id` | OCID do compartment OCI que recebe o bucket. |
| `name` | Nome do bucket. |
| `freeform_tags` | Tags livres opcionais. |

## Garantias

- acesso publico desabilitado;
- camada `Standard`;
- versionamento `Enabled`;
- eventos de objeto e auto-tiering desabilitados;
- `prevent_destroy` habilitado.

O namespace do Object Storage e resolvido pelo provider OCI a partir do
`compartment_id`; nao precisa ser informado pelo chamador.

Para remover um bucket intencionalmente, remova primeiro a protecao do modulo,
revise as versoes dos objetos e obtenha a aprovacao operacional apropriada.
