provider "aws" {
  region = "us-west-2"
}

resource "aws_elb" "bar" {
  # oak9: elastic_load_balancing.load_balancer.connection_draining_policy does not specify a connection draining policy
  # oak9: aws_elb.instances is not configured
  # oak9: elastic_load_balancing.load_balancer.access_logging_policy is not configured to write load balancer access logs to S3
  name               = "foobar-terraform-elb"
  # oak9: elastic_load_balancing.load_balancer.load_balancer_name is not configured
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

  access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    # oak9: aws_elb.listener.instance_protocol is not configured
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "foobar-terraform-elb"
  }
}