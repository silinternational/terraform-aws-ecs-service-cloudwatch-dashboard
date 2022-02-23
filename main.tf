resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.dashboard_name
  dashboard_body = jsonencode({
    widgets = local.widgets
  })
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

locals {
  widgets = [for service_name in var.service_names : {
    type   = "metric"
    width  = 18
    height = 6
    properties = {
      view    = "timeSeries"
      stacked = false
      metrics = [
        ["AWS/ECS", "CPUUtilization", "ServiceName", service_name, "ClusterName", var.cluster_name, { color = "#d62728", stat = "Maximum" }],
        [".", "MemoryUtilization", ".", ".", ".", ".", { yAxis = "right", color = "#1f77b4", stat = "Maximum" }]
      ]
      region = var.aws_region,
      annotations = {
        horizontal = [
          {
            color = "#ff9896",
            label = "100% CPU",
            value = 100
          },
          {
            color = "#9edae5",
            label = "100% Memory",
            value = 100,
            yAxis = "right"
          },
        ]
      }
      yAxis = {
        left = {
          min = 0
        }
        right = {
          min = 0
        }
      }
      title  = "${var.cluster_name} / ${service_name}"
      period = 300
    }
  }]
}
