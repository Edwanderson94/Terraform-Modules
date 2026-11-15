output "policy_arns" {
  description = "ARNs das policies gerenciadas criadas pelo módulo."
  value       = { for key, policy in aws_iam_policy.this : key => policy.arn }
}

output "group_names" {
  description = "Nomes dos grupos IAM criados pelo módulo."
  value       = { for key, group in aws_iam_group.this : key => group.name }
}

output "user_names" {
  description = "Nomes dos usuários IAM criados pelo módulo."
  value       = { for key, user in aws_iam_user.this : key => user.name }
}

output "role_arns" {
  description = "ARNs das roles IAM criadas pelo módulo."
  value       = { for key, role in aws_iam_role.this : key => role.arn }
}

output "role_names" {
  description = "Nomes das roles IAM criadas pelo módulo."
  value       = { for key, role in aws_iam_role.this : key => role.name }
}
