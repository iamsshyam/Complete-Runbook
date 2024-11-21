# Provider configuration
provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# Resource example: Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-bucket-name"
}
