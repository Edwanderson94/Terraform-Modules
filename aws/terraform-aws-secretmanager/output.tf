output "secret_ids" {
  description = "IDs dos secrets criados"
  value       = aws_secretsmanager_secret.secret[*].id
}

output "secret_arns" {
  description = "ARNs dos secrets criados"
  value       = aws_secretsmanager_secret.secret[*].arn
}