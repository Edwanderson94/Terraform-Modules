# Terraform Modules

This repository contains reusable Terraform modules for AWS, Azure DevOps, and OCI.
Keep provider authentication, environment values, and resource lookup in consumers;
keep modules generic and contract-driven.

## Local guidance

- Use the global `gitflow` skill for branch, release, merge, tag, and cleanup work.
- Read `.codex/steering/terraform-modules.md` before changing module architecture,
  contracts, publication, or operational behavior.
- Use `.codex/skills/terraform-azuredevops-module/SKILL.md` for Azure DevOps modules.
- Use `.codex/skills/terraform-oci-module/SKILL.md` for OCI modules.

## Boundaries

- Preserve fixed provider compatibility and module contracts.
- Do not embed organization, project, account, environment, or credential values in
  reusable modules.
- Do not run `apply`, `destroy`, backend migration, or state commands without explicit
  confirmation.
- Never commit secrets, state, plans, or credential-bearing examples.

## Verification

For module changes, use `terraform fmt -check -recursive`,
`terraform init -backend=false`, and `terraform validate` where the module/example
supports those checks. Report skipped checks and why.
