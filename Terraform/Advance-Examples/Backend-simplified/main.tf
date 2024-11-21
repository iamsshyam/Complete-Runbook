# main.tf
provider "aws" {
  region = "us-west-2"  # Set to your AWS region
}

# S3 bucket for state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket"  # Replace with a unique bucket name
  acl    = "private"

  versioning {
    enabled = true
  }
}

# DynamoDB table for state lock
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
