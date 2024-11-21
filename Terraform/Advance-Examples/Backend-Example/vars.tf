variable "region" {
  default = "us-west-2"
}

variable "bucket_name" {
  description = "S3 bucket name for storing Terraform state"
  type        = string
}
