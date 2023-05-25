module "simple" {
  source = "../"

  cluster_name   = "cluster"
  dashboard_name = "dashboard"
  service_names  = ["service"]
}

module "full" {
  source = "../"

  cluster_name   = "cluster"
  dashboard_name = "dashboard"
  service_names  = ["service1", "service2"]
}
