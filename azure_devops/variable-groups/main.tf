resource "azuredevops_variable_group" "this" {
  project_id   = var.project_id
  name         = var.name
  description  = var.description
  allow_access = var.allow_access

  dynamic "variable" {
    for_each = var.variables

    content {
      name  = variable.key
      value = variable.value
    }
  }

  dynamic "variable" {
    for_each = var.secret_variables

    content {
      name         = variable.key
      secret_value = variable.value
      is_secret    = true
    }
  }

  dynamic "key_vault" {
    for_each = var.key_vault == null ? [] : [var.key_vault]

    content {
      name                = key_vault.value.name
      service_endpoint_id = key_vault.value.service_endpoint_id
      search_depth        = key_vault.value.search_depth
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
