variable "default_region" {
  description = "default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "stages" {
  type    = list(string)
  default = ["db-one", "db-two"]
}
