resource "aws_cloudwatch_log_group" "log_group_for_lambda" {
  name = "/log_group_for_lambda"
}

resource "aws_lambda_function" "log_group_lambda" {
  layers = [aws_lambda_layer_version.lambda_layer.arn]

  filename      = "./golambdademo/main.zip"
  function_name = "log_group"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main"

  runtime = "go1.x"

  environment {
    variables = {
      name = var.lambda_name
    }
  }
}

resource "aws_cloudwatch_log_subscription_filter" "demo_logfilter" {
  name            = "demo_logfilter"
  log_group_name  = aws_cloudwatch_log_group.log_group_for_lambda.name
  filter_pattern  = "{ $.LogLevel = \"Error\" }"
  destination_arn = aws_lambda_function.log_group_lambda.arn
}

