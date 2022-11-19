resource "aws_cloudwatch_log_group" "log_group_for_lambda" {
  name = "/log_group_for_lambda"
}

resource "aws_lambda_function" "log_group_lambda" {
  layers = [aws_lambda_layer_version.lambda_layer.arn]

  filename      = "./zip/main.zip"
  function_name = "log_group"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main"

  runtime = "go1.x"

  environment {
    variables = {
      server   = "thisfortest"
      user     = "user"
      password = "password"
      port     = 111
      database = ""
    }
  }
}

resource "aws_cloudwatch_log_subscription_filter" "demo_logfilter" {
  name            = "demo_logfilter"
  depends_on      = [aws_lambda_permission.allow_cloudwatch]
  log_group_name  = aws_cloudwatch_log_group.log_group_for_lambda.name
  filter_pattern  = "{ $.LogLevel = \"Error\" }"
  destination_arn = aws_lambda_function.log_group_lambda.arn
}

data "aws_caller_identity" "current" {}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id   = "AllowExecutionFromCloudWatch_0"
  action         = "lambda:InvokeFunction"
  function_name  = aws_lambda_function.log_group_lambda.function_name
  source_account = data.aws_caller_identity.current.account_id
  principal      = "logs.amazonaws.com"
  source_arn     = "${aws_cloudwatch_log_group.log_group_for_lambda.arn}:*"
}
