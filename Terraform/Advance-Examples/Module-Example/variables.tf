variable "cidr_block" {
  type = string
}

variable "subnet_count" {
  type = number
}

variable "availability_zones" {
  type = list(string)
}
