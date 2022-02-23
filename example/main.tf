module "dashboard" {
  source         = "../"
  aws_region     = var.aws_region
  cluster_name   = "a-cluster"
  dashboard_name = "my-dashboard"
  service_names  = ["service-1", "service-2"]
}
