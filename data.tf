data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = [
        "events.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions = [
      "events:CreateArchive",
      "events:CreateConnection",
      "events:Describe*",
      "events:InvokeApiDestination",
      "events:List*",
      "events:PutEvents",
      "events:PutPartnerEvents",
      "events:PutPermission",
      "events:PutRule",
      "events:PutTargets",
      "events:StartReplay",
      "events:TestEventPattern",
      "events:UpdateApiDestination",
      "events:UpdateArchive",
      "events:UpdateConnection",
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "textract:DetectDocumentText",
      "textract:StartDocumentTextDetection",
      "textract:GetDocumentTextDetection"
    ]
    resources = ["*"]
  }
  statement {
    actions   = ["xray:*"]
    resources = ["*"]
  }
  statement {
    actions = [
      "secretsmanager:GetSecretValue",
    ]
    resources = ["arn:aws:secretsmanager:*:*:secret:email*", "arn:aws:secretsmanager:*:*:secret:/shared-services/*"]
  }
  statement {
    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:Get*",
      "sqs:List*"
    ]
    resources = [
      "arn:aws:sqs:us-east-1:${var.aws_account_id}:${var.prefix}*",
    ]
  }
  statement {
    actions = [
      "ssm:List*",
      "ssm:Get*",
      "ssm:Describe*"
    ]
    resources = [
      "arn:aws:ssm:us-east-1:${var.aws_account_id}:parameter/${var.prefix}/*",
    ]
  }
  
  statement {
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:AssignPrivateIpAddresses",
      "ec2:UnassignPrivateIpAddresses",
      "ec2:List*",
      "ec2:Get*",
      "ec2:Describe*",
      "ec2:UnassignPrivateIpAddresses",
      "ec2:List*",
      "ec2:Get*",
      "ec2:DescribeNetworkInterfaces",
      "ec2:Describe*",
      "ec2:DeleteNetworkInterface",
      "ec2:CreateNetworkInterface",
      "ec2:AssignPrivateIpAddresses"
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "lambda:*",
    ]
    resources = [
      "arn:aws:lambda:us-east-1:${var.aws_account_id}:function:${var.prefix}*",
    ]
  }
}

