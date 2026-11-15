variable "policies" {
  description = "Policies gerenciadas pelo módulo, indexadas por uma chave estável."
  type = map(object({
    name        = string
    path        = optional(string, "/")
    description = optional(string)
    policy      = string
    tags        = optional(map(string), {})
  }))
  default  = {}
  nullable = false
}

variable "groups" {
  description = "Grupos IAM e seus attachments de policies."
  type = map(object({
    name                = string
    path                = optional(string, "/")
    managed_policy_arns = optional(set(string), [])
    inline_policies     = optional(map(string), {})
  }))
  default  = {}
  nullable = false
}

variable "users" {
  description = "Usuários IAM sem criação de access keys pelo módulo."
  type = map(object({
    name                 = string
    path                 = optional(string, "/")
    force_destroy        = optional(bool, false)
    permissions_boundary = optional(string)
    groups               = optional(set(string), [])
    managed_policy_arns  = optional(set(string), [])
    inline_policies      = optional(map(string), {})
    tags                 = optional(map(string), {})
  }))
  default  = {}
  nullable = false
}

variable "roles" {
  description = "Roles IAM e suas trust, permission e managed policies."
  type = map(object({
    name                  = string
    assume_role_policy    = string
    path                  = optional(string, "/")
    description           = optional(string)
    max_session_duration  = optional(number, 3600)
    permissions_boundary  = optional(string)
    force_detach_policies = optional(bool, false)
    managed_policy_arns   = optional(set(string), [])
    inline_policies       = optional(map(string), {})
    tags                  = optional(map(string), {})
  }))
  default  = {}
  nullable = false

  validation {
    condition = alltrue([
      for role in values(var.roles) : role.max_session_duration >= 3600 && role.max_session_duration <= 43200
    ])
    error_message = "max_session_duration deve estar entre 3600 e 43200 segundos."
  }
}

