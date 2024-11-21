terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "terraform.tfstate"
    region         = var.region
    dynamodb_table = "${var.bucket_name}-lock"
    encrypt        = true
  }
}
