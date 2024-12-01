resource "aws_secretsmanager_secret" "secret" {
  for_each = { for secret_name, secret_value in var.secrets : secret_name => secret_value }

  name        = each.key
  description = "Secret for ${each.key}"
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  for_each = { for secret_name, secret_value in var.secrets : secret_name => secret_value }

  secret_id     = aws_secretsmanager_secret.secret[each.key].id
  secret_string = each.value
}