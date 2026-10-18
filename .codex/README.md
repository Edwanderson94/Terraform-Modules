# Orientações Codex para Terraform-Modules

- `steering/terraform-modules.md` define arquitetura, compatibilidade, segurança
  e publicação dos módulos deste repositório.
- `skills/terraform-azuredevops-module/SKILL.md` descreve o fluxo de criação,
  validação e consumo dos módulos Azure DevOps.
- `skills/terraform-oci-module/SKILL.md` descreve o fluxo de criação, validação
  e consumo dos módulos OCI.
- Um módulo deve ter contrato explícito (`variables.tf`, `outputs.tf`), versões,
  README com exemplo e validação local. Valores específicos de organização,
  projetos e ambientes pertencem ao repositório consumidor.
- Nunca colocar credenciais, state ou planos neste repositório.
