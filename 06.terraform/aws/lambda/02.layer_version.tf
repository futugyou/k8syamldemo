resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "./golambdademo/main.zip"
  layer_name = var.lambda_name

  compatible_runtimes = ["go1.x"]
}
