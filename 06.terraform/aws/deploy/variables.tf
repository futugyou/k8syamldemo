variable "region" {
  description = "cluster region"
  type        = string
  default     = "ap-southeast-1"
}
 
variable "cluster_name" {
  description = "Name of Cluster"
  type        = string
  default     = "eks-osim-dev"
} 

variable "dapr_charts_url" {
  description = "dapr charts url"
  type        = string
  default     = "https://dapr.github.io/helm-charts/"
}

variable "dapr-namespace" {
  description = "dapr namespace"
  type        = string
  default     = "dapr-system"
}

variable "dapr-version" {
  description = "dapr version"
  type        = string
  default     = "1.8.0"
}

variable "istio_charts_url" {
  description = "istio charts url"
  type        = string
  default     = "https://istio-release.storage.googleapis.com/charts/"
}

variable "istio-namespace" {
  description = "istio namespace"
  type        = string
  default     = "istio-system"
}

variable "istio-version" {
  description = "istio version"
  type        = string
  default     = "1.14.2"
}

variable "gocd_charts_url" {
  description = "gocd charts url"
  type        = string
  default     = "https://gocd.github.io/helm-chart"
}

variable "gocd-namespace" {
  description = "gocd namespace"
  type        = string
  default     = "gocd"
}

variable "known_hosts" {
  description = "known hosts"
  type        = list(string)
  default     = ["github.com"]
}

variable "openfaas_charts_url" {
  description = "openfaas charts url"
  type        = string
  default     = "https://openfaas.github.io/faas-netes"
}

variable "openfaas_namespace" {
  description = "openfaas namespace"
  type        = string
  default     = "openfaas"
}

variable "openfaas_fn_namespace" {
  description = "openfaas namespace"
  type        = string
  default     = "openfaas-fn"
}
