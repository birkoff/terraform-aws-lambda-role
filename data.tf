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
    actions   = length(var.resources["events"]) > 0 ? var.actions["events"] : []
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
    actions   = length(var.resources["s3"]) > 0 ? var.actions["s3"] : []
    resources = var.resources["s3"]
  }
  statement {
    actions   = var.actions["ec2"]
    resources = ["*"] # This is required for the Lambda to be able to create ENIs
  }
  statement {
    actions   = var.actions["lambda"]
    resources = var.resources["lambda"]
  }
  statement {
    actions   = length(var.resources["ses"]) > 0 ? var.actions["ses"] : []
    resources = var.resources["ses"]
  }
  statement {
    actions   = var.actions["kms"]
    resources = var.resources["kms"]
  }
}

