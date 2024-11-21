provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-west-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

resource "aws_s3_bucket" "rds_export" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "rds_export_policy" {
  bucket = aws_s3_bucket.rds_export.id

  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Principal = "*",
          Action = "s3:GetObject",
          Resource = "${aws_s3_bucket.rds_export.arn}/*"
        }
      ]
    }
  )
}

output "bucket_name" {
  value = aws_s3_bucket.rds_export.bucket
}
