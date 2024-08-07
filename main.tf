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

data "aws_iam_policy_document" "ses" {
  statement {
    effect    = "Allow"
    actions   = var.actions["ses"]
    resources = var.resources["ses"]
  }
}

resource "aws_iam_policy" "ses" {
  count       = length(var.resources["ses"]) > 0 ? 1 : 0
  name        = "${var.name_prefix}-SES-policy"
  description = "${var.name_prefix} SES policy"
  policy      = data.aws_iam_policy_document.ses.json
}

resource "aws_iam_role_policy_attachment" "ses" {
  depends_on = [aws_iam_policy.ses]
  count      = length(var.resources["ses"]) > 0 ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ses.0.arn
}
####
data "aws_iam_policy_document" "s3" {
  statement {
    effect    = "Allow"
    actions   = var.actions["s3"]
    resources = var.resources["s3"]
  }
}

resource "aws_iam_policy" "s3" {
  count       = length(var.resources["s3"]) > 0 ? 1 : 0
  name        = "${var.name_prefix}-s3-policy"
  description = "${var.name_prefix} s3 policy"
  policy      = data.aws_iam_policy_document.s3.json
}

resource "aws_iam_role_policy_attachment" "s3" {
  depends_on = [aws_iam_policy.s3]
  count      = length(var.resources["s3"]) > 0 ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3.0.arn
}
