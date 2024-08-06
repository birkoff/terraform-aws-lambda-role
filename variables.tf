variable "name_prefix" {
  type = string
}

variable "resources" {
  type    = map(list(string))
  default = {}
}

variable "actions" {
  type = map(list(string))
  default = {
    "events" : [
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
    ],
    "logs" : [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
    ],
    "xray" : [
      "xray:*",
    ],
    "secretsmanager" : [
      "secretsmanager:GetSecretValue",
    ],
    "ssm" : [
      "ssm:List*",
      "ssm:Get*",
      "ssm:Describe*"
    ],
    "s3" : [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectTagging",
      "s3:GetObjectVersion",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectRetention",
      "s3:PutObjectTagging",
      "s3:PutObjectVersionAcl",
      "s3:PutObjectVersionTagging",
      "s3:RestoreObject",
      "s3:Get*",
      "s3:List*"
    ],
    "ec2" : [
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
    ],
    "lambda" : [
      "lambda:*",
    ],
    "ses" : [
      "ses:SendRawEmail",
      "ses:SendEmail"
    ],
    "kms" : [
      "kms:*",
    ]
  }
}

variable "path" {}
