resource "aws_dynamodb_table" "terraform_locks" {
  count        = length(var.stages)
  name         = format("terraform_locks_%s", var.stages[count.index])
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}