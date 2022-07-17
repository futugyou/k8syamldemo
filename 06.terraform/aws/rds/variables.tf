variable "identifier" {
  description = "identifier"
  type        = string
  default     = "onecloud-dev"
}

variable "instance_class" {
  description = "instance class"
  type        = string
  default     = "db.t2.small"
}

variable "security_group_ids" {
  description = "vpc security group ids"
  type        = list(string)
  default     = ["sg-00f39bc46245f6224"]
}

variable "subnet_group" {
  description = "db subnet group name"
  type        = string
  default     = "default-vpc-01de25ab26f027bf5"
}