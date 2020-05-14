resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.dashboard_name
  dashboard_body = data.template_file.dashboard_body.rendered
}

data "template_file" "dashboard_body" {
  template = file("${path.module}/dashboard-template.json")

  vars = {
    widgets_json = join(",", data.template_file.widgets.*.rendered)
  }
}

data "template_file" "widgets" {
  count    = length(var.service_names)
  template = file("${path.module}/widget-template.json")

  vars = {
    aws_region   = var.aws_region
    cluster_name = var.cluster_name
    service_name = element(var.service_names, count.index)
  }
}
