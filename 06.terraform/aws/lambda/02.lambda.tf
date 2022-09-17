resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
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
