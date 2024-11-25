provider "aws" {
    region = "eu-west-2"
  
}

resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "igw_def" {
  vpc_id = "${aws_vpc.dev_vpc.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.dev_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw_def.id}"
}

resource "aws_subnet" "priv_subnet" {
  vpc_id                  = "${aws_vpc.dev_vpc.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

}

# Our default security group to access the instances
resource "aws_security_group" "dev_sg" {
  name        = "Project - Terraform"
  description = "Project - Terraform"
  vpc_id      = "${aws_vpc.dev_vpc.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating Instance
resource "aws_instance" "demoinstance" {
 
  # Instance size
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region we specified
  ami = "${lookup(var.aws_amis, var.aws_region)}"

  tags = {
    Name = "demoinstance"
  }

  # Root Block Storage
  root_block_device {
    volume_size = "40"
    volume_type = "standard"
  }

  # EBS Block Storage
  ebs_block_device {
    device_name           = "/dev/sdb"
    volume_size           = "80"
    volume_type           = "standard"
    delete_on_termination = false
  }

  # Attaching Security Group
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  # Subnet ID in which the instance will spawn
  subnet_id = "${aws_subnet.default.id}"
}