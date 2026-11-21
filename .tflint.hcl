# Existing modules include provider-only entrypoints and compatibility variables
# that are intentionally validated by Terraform consumers rather than by the
# module root. Keep the remaining TFLint rules enabled.
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_unused_declarations" {
  enabled = false
}
