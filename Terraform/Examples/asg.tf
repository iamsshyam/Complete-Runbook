provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG"
  type        = list(string)
}


resource "aws_launch_template" "example_template" {
  name_prefix   = "example_template"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "example_asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.example_template.id
    version = "$Latest"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
}

output "asg_name" {
  value = aws_autoscaling_group.example_asg.name
}
