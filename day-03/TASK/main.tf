terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  required_version = ">= 1.5.0"
}

# AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Random Provider (optional config block)
provider "random" {}

# Generate random suffix for unique S3 bucket name
resource "random_id" "bucket_id" {
  byte_length = 4
}

# Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}


# Create S3 bucket with implicit dependency on VPC
resource "aws_s3_bucket" "bucket" {
  bucket = "atul-terraform-${random_id.bucket_id.hex}"

  tags = {
    Name        = "my-bucket"
    Environment = "Dev"
    # This creates an implicit dependency on the VPC
    VPC_ID = aws_vpc.main_vpc.id
  }
}

# Output values
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
