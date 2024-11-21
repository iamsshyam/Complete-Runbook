# backend.tf
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"      # S3 bucket name
    key            = "global/s3/terraform.tfstate"    # Path for the state file in S3
    region         = "us-west-2"                      # AWS region
    dynamodb_table = "terraform-lock-table"           # DynamoDB table name
    encrypt        = true                             # Enable encryption for state file
  }
}
