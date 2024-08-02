# IAM Roles
resource "aws_iam_role" "lambda_execution_role" {
  name               = "${var.prefix}-lambda-execution-role-2"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json

  inline_policy {
    name   = "${var.prefix}-lambda-inline-policy"
    policy = data.aws_iam_policy_document.inline_policy.json
  }
}