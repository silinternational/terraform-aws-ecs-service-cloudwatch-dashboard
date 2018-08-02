
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.dashboard_name}"
  dashboard_body = "${data.template_file.dashboard_body.rendered}"
}

data "template_file" "dashboard_body" {
  template = "${file("${path.module}/dashboard-template.json")}"

  vars {
    aws_region = "${var.aws_region}"
    cluster_name = "${var.cluster_name}"
    service_name = "${var.service_name}"
  }
}
