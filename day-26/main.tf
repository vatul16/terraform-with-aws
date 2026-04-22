terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "atul-learning-terraform-v101"

  tags = {
    Name        = "My Bucket 2.0"
    Environment = "Dev"
  }
}