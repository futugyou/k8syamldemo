resource "aws_lambda_function" "golang_lambda" {
  layers = [aws_lambda_layer_version.lambda_layer.arn]

  filename      = "./golambdademo/main.zip"
  function_name = var.lambda_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main"

  runtime = "go1.x"

  environment {
    variables = {
      name = var.lambda_name
    }
  }
}
