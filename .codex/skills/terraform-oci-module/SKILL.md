---
name: terraform-oci-module
description: "Cria, revisa, valida e documenta módulos Terraform reutilizáveis para OCI neste repositório."
---

# Skill — módulo Terraform para OCI

## Quando usar

Use ao criar ou alterar módulos sob `oci/`, ou ao integrar esses módulos em uma
camada Terraform/Terragrunt consumidora.

## Fluxo

1. Leia `../steering/terraform-modules.md` e qualquer `AGENTS.md` aplicável no
   repositório consumidor.
2. Inspecione o contrato atual, a versão fixada do provider, lockfile, state e
   `git status`; preserve mudanças do usuário.
3. Mantenha provider, autenticação, backend e dados de ambiente no consumidor.
   O módulo recebe inputs tipados e limita-se aos recursos documentados.
4. Documente defaults de segurança, lifecycle, dependências, outputs,
   importação e riscos destrutivos. Inclua um exemplo sem credenciais.
5. Confirme o schema da versão do provider configurada, não apenas a versão
   `latest` da documentação.
6. Rode `terraform fmt -check -recursive`, `terraform init -backend=false` e
   `terraform validate` no exemplo, quando possível. Não execute plan contra OCI
   sem necessidade, nem apply/destroy sem aprovação do plano.
7. Para recursos existentes, verifique duplicidade e state antes de planejar.
   Buckets existentes devem ser avaliados para importação, não recriados.
8. Relate comandos, validações, limitações e se houve ou não operação remota.

## Módulo Object Storage Bucket

- Cria bucket privado Standard com versionamento e `prevent_destroy`.
- Não provisiona compartment, IAM, chaves KMS, backend ou state remoto.
- O state de bootstrap deve permanecer em backend independente e recuperável.
- `prevent_destroy` só pode ser removido por mudança explícita e revisão
  operacional; nunca como workaround de erro.
