provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-west-2"
}

variable "security_group_id" {
  description = "Security group ID for the load balancer"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}

resource "aws_lb" "example_lb" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Welcome to the load balancer!"
      status_code  = "200"
    }
  }
}

output "lb_dns_name" {
  value = aws_lb.example_lb.dns_name
}
