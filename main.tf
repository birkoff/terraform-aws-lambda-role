# IAM Roles
resource "aws_iam_role" "this" {
  name               = "${var.name_prefix}-lambda-role"
  path               = var.path
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json

  inline_policy {
    name   = "${var.name_prefix}-lambda-policy"
    policy = data.aws_iam_policy_document.inline_policy.json
  }
}