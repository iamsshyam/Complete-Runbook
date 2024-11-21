provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-west-2"
}

variable "allocated_storage" {
  default = 20
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the RDS instance"
  type        = string
}

resource "aws_db_instance" "example" {
  identifier             = "example-db-instance"
  allocated_storage      = var.allocated_storage
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.example.name
  vpc_security_group_ids = [var.security_group_id]

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "example" {
  name       = "example-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "ExampleDBSubnetGroup"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.example.endpoint
}
