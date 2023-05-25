
variable "cluster_name" {
  description = "The exact name of the cluster"
  type        = string
}

variable "dashboard_name" {
  description = "The name you want to use for this CloudWatch dashboard"
  type        = string
}

variable "service_names" {
  description = "A list of the exact names of the services to show on the dashboard"
  type        = list(string)
}
