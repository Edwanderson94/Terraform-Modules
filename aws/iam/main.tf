resource "aws_iam_policy" "this" {
  for_each = var.policies

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  policy      = each.value.policy
  tags        = each.value.tags
}

resource "aws_iam_group" "this" {
  for_each = var.groups

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_group_policy" "this" {
  for_each = {
    for item in flatten([
      for group_key, group in var.groups : [
        for policy_name, policy_document in group.inline_policies : {
          key             = "${group_key}:${policy_name}"
          group_key       = group_key
          policy_name     = policy_name
          policy_document = policy_document
        }
      ]
    ]) : item.key => item
  }

  name   = each.value.policy_name
  group  = aws_iam_group.this[each.value.group_key].name
  policy = each.value.policy_document
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each = {
    for item in flatten([
      for group_key, group in var.groups : [
        for policy_arn in group.managed_policy_arns : {
          key        = "${group_key}:${policy_arn}"
          group_key  = group_key
          policy_arn = policy_arn
        }
      ]
    ]) : item.key => item
  }

  group      = aws_iam_group.this[each.value.group_key].name
  policy_arn = each.value.policy_arn
}

resource "aws_iam_user" "this" {
  for_each = var.users

  name                 = each.value.name
  path                 = each.value.path
  force_destroy        = each.value.force_destroy
  permissions_boundary = each.value.permissions_boundary
  tags                 = each.value.tags
}

resource "aws_iam_user_group_membership" "this" {
  for_each = {
    for key, user in var.users : key => user
    if length(user.groups) > 0
  }

  user = aws_iam_user.this[each.key].name
  groups = [
    for group_key in each.value.groups : aws_iam_group.this[group_key].name
  ]
}

resource "aws_iam_user_policy" "this" {
  for_each = {
    for item in flatten([
      for user_key, user in var.users : [
        for policy_name, policy_document in user.inline_policies : {
          key             = "${user_key}:${policy_name}"
          user_key        = user_key
          policy_name     = policy_name
          policy_document = policy_document
        }
      ]
    ]) : item.key => item
  }

  name   = each.value.policy_name
  user   = aws_iam_user.this[each.value.user_key].name
  policy = each.value.policy_document
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each = {
    for item in flatten([
      for user_key, user in var.users : [
        for policy_arn in user.managed_policy_arns : {
          key        = "${user_key}:${policy_arn}"
          user_key   = user_key
          policy_arn = policy_arn
        }
      ]
    ]) : item.key => item
  }

  user       = aws_iam_user.this[each.value.user_key].name
  policy_arn = each.value.policy_arn
}

resource "aws_iam_role" "this" {
  for_each = var.roles

  name                  = each.value.name
  assume_role_policy    = each.value.assume_role_policy
  path                  = each.value.path
  description           = each.value.description
  max_session_duration  = each.value.max_session_duration
  permissions_boundary  = each.value.permissions_boundary
  force_detach_policies = each.value.force_detach_policies
  tags                  = each.value.tags
}

resource "aws_iam_role_policy" "this" {
  for_each = {
    for item in flatten([
      for role_key, role in var.roles : [
        for policy_name, policy_document in role.inline_policies : {
          key             = "${role_key}:${policy_name}"
          role_key        = role_key
          policy_name     = policy_name
          policy_document = policy_document
        }
      ]
    ]) : item.key => item
  }

  name   = each.value.policy_name
  role   = aws_iam_role.this[each.value.role_key].name
  policy = each.value.policy_document
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = {
    for item in flatten([
      for role_key, role in var.roles : [
        for policy_arn in role.managed_policy_arns : {
          key        = "${role_key}:${policy_arn}"
          role_key   = role_key
          policy_arn = policy_arn
        }
      ]
    ]) : item.key => item
  }

  role       = aws_iam_role.this[each.value.role_key].name
  policy_arn = each.value.policy_arn
}
