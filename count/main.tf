terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_elb" "web" {
  # oak9: elastic_load_balancing.load_balancer.app_cookie_stickiness_policy does not specify the application-controlled sticky session policy for the load balancer
  # oak9: elastic_load_balancing.load_balancer.connection_settings is not configured
  # oak9: elastic_load_balancing.load_balancer.scheme is not configured
  # oak9: elastic_load_balancing.load_balancer.policies is not configured
  # oak9: elastic_load_balancing.load_balancer.listeners[0].load_balancer_port is not configured
  # oak9: elastic_load_balancing.load_balancer.listeners[0].policy_names is not configured
  # oak9: elastic_load_balancing.load_balancer.connection_draining_policy does not specify a connection draining policy
  # oak9: elastic_load_balancing.load_balancer.health_check is not configured
  # oak9: elastic_load_balancing.load_balancer.access_logging_policy is not configured to write load balancer access logs to S3
  name = "terraform-example-elb"
  # oak9: elastic_load_balancing.load_balancer.load_balancer_name is not configured
  # oak9: elastic_load_balancing.load_balancer.lb_cookie_stickiness_policy[0].policy_name is not configured

  # The same availability zone as our instances
  availability_zones = aws_instance.web.*.availability_zone
  # oak9: aws_elb.availability_zones does not specify availability zones

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  # The instances are registered automatically
  instances = aws_instance.web.*.id
  # oak9: aws_elb.instances is not configured
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  instance_type = "t2.small"
  ami           = data.aws_ami.ubuntu.id

  # This will create 4 instances
  count = 4
}

