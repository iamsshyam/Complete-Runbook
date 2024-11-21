# Multiple EC2 instances are created using a loop. Conditions are used to add specific tags only when certain conditions are met.

provider "aws" {
  region = var.region
}
variable "region" {
  default = "us-west-2"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 3
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "cost_center" {
  description = "Cost center for billing"
  type        = string
  default     = ""
}


resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name        = "ExampleInstance-${count.index}"
    Environment = var.environment
    "Cost Center" = var.cost_center != "" ? var.cost_center : "N/A" # Adds a "Cost Center" tag. If var.cost_center has a value, that value will be used; otherwise, it defaults to "N/A".
  }

  # checks if var.environment is "production". If it is, it creates a tag with "Production" = "true". If not, it doesn’t add any tag.
  dynamic "tags" {
    for_each = var.environment == "production" ? { "Production" = "true" } : {}
    content {
      key   = tags.key
      value = tags.value
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
}

output "instance_ids" {
  value = [for instance in aws_instance.example : instance.id]
}