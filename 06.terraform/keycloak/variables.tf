variable "github_token" {
  description = "github token"
  type        = string
  default     = ""
}

variable "organization" {
  description = "organization"
  type        = string
  default     = ""
}

variable "issue_labels" {
  default = {
    "custom-label"  = "533D99"
    "documentation" = "FFB340"
    "waiting-reply" = "CC6A14"
  }
}

variable "webhook_url" {
  description = "webhook url"
  type        = string
  default     = ""
}
