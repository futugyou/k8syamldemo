variable "region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "s3_bucket_name" {
  description = "s3 bucket name"
  type        = string
  default     = "cdn-bucket-for-terraform"
}
