variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "domain_name" {
  description = "domain name"
  type        = string
  default     = "thisfortfdemo.com"
}


variable "wait_for_validation" {
  description = "wait for validation"
  type        = bool
  default     = true
}
