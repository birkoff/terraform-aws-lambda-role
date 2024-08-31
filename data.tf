data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions   = var.actions["events"]
    resources = var.resources["events"]
  }
  statement {
    actions   = var.actions["logs"]
    resources = var.resources["logs"]
  }
  statement {
    actions   = var.actions["xray"]
    resources = ["*"]
  }
  statement {
    actions   = var.actions["secretsmanager"]
    resources = var.resources["secretsmanager"]
  }
  statement {
    actions   = var.actions["ssm"]
    resources = var.resources["ssm"]
  }
  statement {
    actions   = var.actions["ec2"]
    resources = ["*"] # This is required for the Lambda to be able to create ENIs
  }
  statement {
    actions   = var.actions["lambda"]
    resources = var.resources["lambda"]
  }
#   statement {
#     actions   = var.actions["textract"]
#     resources = var.resources["textract"]
#   }
  statement {
    actions   = ["lambda:GetLayerVersion"]
    resources = ["arn:aws:lambda:*:*:layer:*:*"]
  }
  statement {
    actions   = var.actions["kms"]
    resources = ["*"]
  }
}

