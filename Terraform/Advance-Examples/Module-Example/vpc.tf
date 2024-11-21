resource "aws_vpc" "example_vpc" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "example_subnet" {
  count           = var.subnet_count
  vpc_id          = aws_vpc.example_vpc.id
  cidr_block      = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = element(var.availability_zones, count.index)
}

output "vpc_id" {
  value = aws_vpc.example_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.example_subnet[*].id
}
