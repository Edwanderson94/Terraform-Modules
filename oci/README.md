# Módulos OCI

```mermaid
flowchart LR
    consumer["Consumidor Terraform / Terragrunt"] --> bucket["object-storage-bucket"]
    bucket --> storage["OCI Object Storage\nStandard + privado + versionado"]
    bucket --> guard["prevent_destroy"]
    consumer -. provider + compartment_id .-> bucket
```

| Módulo | Descrição |
| --- | --- |
| [`object-storage-bucket`](./object-storage-bucket) | Bucket privado Standard, versionado e protegido contra destruição acidental. |

Consulte o README de cada módulo para contrato, exemplo, requisitos e riscos.
