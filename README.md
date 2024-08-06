# terraform-aws-lambda-role


```hcl

module "lambda_execution_role" {
  source         = "../lambda-execution-role"
  name_prefix   = var.lambda_role_name_prefix
  path = var.lambda_role_path
  resources = {
    "events" = [module.eventbridge.eventbridge_bus_arn],
    "lambda" = [
      "arn:aws:lambda:us-east-1:${local.aws_account_id}:function:${var.service}*",
      "arn:aws:lambda:us-east-1:${local.aws_account_id}:function:${var.application}-${var.service}*",
    ],
    "logs" = [
      "arn:aws:logs:${var.region}:${local.aws_account_id}:log-group:/aws/lambda/*"
    ],
    "xray" = ["*"],
    "secretsmanager" = ["*"],
    "ssm" = [
      "arn:aws:ssm:${var.region}:${local.aws_account_id}:parameter/${var.application}/${var.service}/*",
      "arn:aws:ssm:${var.region}:${local.aws_account_id}:parameter/platform/*",
      "arn:aws:ssm:${var.region}:${local.aws_account_id}:parameter/${var.application}/*"
    ],
    "s3" = [
      module.document_files.s3_bucket_arn,
      "${module.document_files.s3_bucket_arn}/*"
    ],
    "ses" = ["*"],
    "kms" = ["*"],
  }
}

```