provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_policy" "development_role" {
  name = "development-role"
  description = "Used by developers"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Action = ["s3:*"],
            Effect = "Allow",
            Resource = "*"
    
        } 
    ]
  })
}

output "policy_arn" {
  value = aws_iam_policy.development_role.arn
}