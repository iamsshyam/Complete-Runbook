# Terraform Configuration Structure Reference
# Provider Configuration
provider "aws" {
  region = "us-west-2"            # Define the region, modify as per your needs
}

# Variable Definitions
variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
  default     = "my-default-bucket-name" # Default value (optional)
}

# Local Values (Optional, reusable logic)
locals {
  environment = "development"
}

# Resource Definition Example
resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name         # Referencing the variable defined above
  tags = {                         # Adding tags for easy identification
    Name        = "My S3 Bucket"
    Environment = local.environment
  }
}

# Data Source Example
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]   # Canonical's AWS account ID for Ubuntu
}

# Output Definition
output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.example_bucket.bucket
}

# Module Usage Example (Optional)
module "vpc" {
  source = "./modules/vpc"         # Path to the module directory
  cidr_block = "10.0.0.0/16"       # Module inputs
}

# Remote State Configuration (Optional, for shared state)
terraform {
  backend "s3" {
    bucket = "my-terraform-state"  # S3 bucket for storing the state
    key    = "path/to/state"       # Key (file path) within the bucket
    region = "us-west-2"
  }
}

# Provisioner Block (Optional, for post-deployment actions)
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx"
    ]
  }
}
