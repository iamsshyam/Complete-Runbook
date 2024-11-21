provider "aws" {
  region = var.region
}

variable "region" {
  default = "eu-west-2"
}

variable "aws_ami" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-ksbgi2524556"
}

resource "aws_instance" "dev_instance" {
  ami           = var.aws_ami
  instance_type = "t3.micro"

  tags = {
    Name = "dev-instance_name"
    Env  = "dev"
  }
}

output "instance_id" {
  value = aws_instance.dev_instance.id
}

output "instance_ami" {
  value = aws_instance.dev_instance.ami
}
