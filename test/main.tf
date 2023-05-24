module "simple" {
  source = "../"

  cluster_name   = "cluster"
  dashboard_name = "dashboard"
  service_names  = "service"
}

module "full" {
  source = "../"

  aws_region     = "us-east-1"
  cluster_name   = "cluster"
  dashboard_name = "dashboard"
  service_names  = "service"
}
