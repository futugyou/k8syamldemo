resource "aws_lambda_function" "golang_lambda" {
  layers = [aws_lambda_layer_version.lambda_layer.arn]

  filename      = "./zip/main.zip"
  function_name = var.lambda_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main"

  runtime = "go1.x"
}

data "aws_lambda_invocation" "call_lambda" {
  function_name = aws_lambda_function.golang_lambda.function_name

  input = <<JSON
{
  "server": "thisfortest",
  "user": "user",
  "password": "password",
  "port": 111,
  "database": ""
}
JSON
}