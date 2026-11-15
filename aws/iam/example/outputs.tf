output "user_names" {
  description = "Nomes dos usuários IAM configurados pelo consumidor."
  value       = module.iam.user_names
}
