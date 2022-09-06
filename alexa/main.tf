terraform {
  required_version = ">= 0.12"
}

# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}

# resource "aws_lambda" "default" {
    
# }

resource "aws_lambda_function" "default" {
  # oak9: aws_lambda_function.kms_key_arn is not set to use customer managed keys for encryption
  # oak9: lambda.function.reserved_concurrent_executions is not configured
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  function_name    = "terraform_lambda_alexa_example"
  role             = aws_iam_role.default.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python2.7"
}

#This resource is the core take away of this example.
resource "aws_lambda_permission" "default" {
  statement_id  = "AllowExecutionFromAlexa"
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  function_name = aws_lambda_function.default.function_name
}

resource "aws_iam_role" "default" {
  name = "terraform_lambda_alexa_example"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

###
# Alternatively you could attach the Amazon provided AWSLambdaBasicExecutionRole
# via an aws_iam_policy_attachment resource. However, the aws_iam_policy_attachment
# resource can be [destructive](https://www.terraform.io/docs/providers/aws/r/iam_policy_attachment.html)
# so it was avoided for the purporse of this example.
resource "aws_iam_role_policy" "default" {
  name = "terraform_lambda_alexa_example"
  role = aws_iam_role.default.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
