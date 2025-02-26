provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"
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

resource "aws_lambda_function" "serverless_lambda" {
  function_name    = "my-serverless-app"
  role            = aws_iam_role.lambda_role.arn
  handler         = "lambda_function.lambda_handler"
  runtime         = "python3.8"
  filename        = "../lambda/function.zip"
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/my-serverless-app"
  retention_in_days = 7
}
