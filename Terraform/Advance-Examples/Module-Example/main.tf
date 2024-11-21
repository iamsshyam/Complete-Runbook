provider "aws" {
  region = var.region
}

variable "region" {
    default = "eu-west-2"
  
}

module "vpc" {
  source             = "./vpc"
  cidr_block         = "10.0.0.0/16"
  subnet_count       = 2
  availability_zones = data.aws_availability_zones.available.names
}

data "aws_availability_zones" "available" {}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}
