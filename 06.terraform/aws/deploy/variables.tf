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