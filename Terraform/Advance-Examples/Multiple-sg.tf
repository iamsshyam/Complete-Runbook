provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-west-2"
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules to apply to the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
  }))
  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_block = "0.0.0.0/0" },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_block = "0.0.0.0/0" }
  ]
}

resource "aws_security_group" "example_sg" {
  name   = "example_sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = [ingress.value["cidr_block"]]
    }
  }

  tags = {
    Name = "ExampleSG"
  }
}

output "security_group_id" {
  value = aws_security_group.example_sg.id
}
