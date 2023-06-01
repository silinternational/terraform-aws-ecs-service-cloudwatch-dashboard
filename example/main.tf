module "dashboard" {
  source         = "../"
  cluster_name   = "a-cluster"
  dashboard_name = "my-dashboard"
  service_names  = ["service-1", "service-2"]
}
