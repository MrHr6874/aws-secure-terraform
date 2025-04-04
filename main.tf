# Define the AWS provider
provider "aws" {
  region = "ap-south-1"  # Change this to your preferred AWS region
}

resource "aws_s3_bucket" "security_logs" {
  bucket = "my-security-logs-${var.account_id}"
}

# S3 Bucket Policy (Instead of creating a new bucket)
resource "aws_s3_bucket_policy" "security_logs_policy" {
  bucket = aws_s3_bucket.security_logs.id
  policy = jsonencode({
    Statement = [{
      Action    = ["s3:GetObject", "s3:PutObject"]
      Effect    = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${var.account_id}:root"
      }
      Resource = "arn:aws:s3:::${aws_s3_bucket.security_logs.id}/*"
    }]
    Version = "2012-10-17"
  })
}


# Enable AWS Security Hub
resource "aws_securityhub_account" "main" {}

# Enable AWS GuardDuty
resource "aws_guardduty_detector" "gd" {
  enable = true
}



# IAM Role for Security Auditing
resource "aws_iam_role" "security_audit_role" {
  name = "SecurityAuditRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        AWS = "arn:aws:iam::${var.account_id}:root"
      }
    }]
  })

  tags = {
    Name        = "Security Audit Role"
    Environment = "Production"
  }
}

