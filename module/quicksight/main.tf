# This module configures QuickSight with an IAM user and allows you to grant 
# necessary permissions for the user to access datasets and create dashboards.

resource "aws_quicksight_user" "admin_user" {
  email     = var.email
  identity_type = "IAM"
  user_name = var.username
  aws_account_id = data.aws_caller_identity.current.account_id
  namespace = "default"
  user_role = "ADMIN"
}

resource "aws_quicksight_group_membership" "admin_membership" {
  group_name = "default"
  member_name = aws_quicksight_user.admin_user.user_name
  aws_account_id = data.aws_caller_identity.current.account_id
  namespace = "default"
}

data "aws_caller_identity" "current" {}
