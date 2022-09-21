variable "default_region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}

variable "grafana_name" {
  description = "grafana name"
  type        = string
  default     = "grafana-tf"
}

variable "grafana_users" {
  description = "grafana users"
  type        = list(string)
  default     = [""]
}
