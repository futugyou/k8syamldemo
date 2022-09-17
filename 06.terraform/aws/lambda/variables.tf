variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "lambda_iam_role" {
  description = "lambda iam role"
  type        = string
  default     = "iam_for_lambda"
}

variable "lambda_name" {
  description = "lambda name"
  type        = string
  default     = "lambda_golang_function"
}
