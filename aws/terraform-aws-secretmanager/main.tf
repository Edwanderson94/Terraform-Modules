resource "aws_secretsmanager_secret" "secret" {
  for_each = { for secret_name, secret_value in var.secrets : secret_name => secret_value }

  name        = each.key
  description = "Secret para ${each.key}"
  recovery_window_in_days  = lookup(var.recovery_windows, each.key, var.default_recovery_window_in_days)
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  for_each = { for secret_name, secret_value in var.secrets : secret_name => secret_value }

  secret_id     = aws_secretsmanager_secret.secret[each.key].id
  secret_string = each.value
}