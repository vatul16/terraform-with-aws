terraform {
  backend "s3" {
    bucket       = "atul-terraform-state-v1"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

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

variable "environment" {
  default = "dev"
  type    = string
}

variable "my_name" {
  default = "atul"
  type    = string
}

variable "region" {
  default = "us-east-1"
}

locals {
  bucket_name = "${var.my_name}-learning-terraform-v1-${var.environment}"
  vpc_name    = "${var.environment}-VPC"
}

# Create S3 Bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}

resource "aws_vpc" "sample_vpc" {
  cidr_block = "10.0.1.0/24"
  region     = var.region

  tags = {
    Name        = local.vpc_name
    Environment = var.environment
  }
}

resource "aws_instance" "example" {
  ami           = "ami-01b14b7ad41e17ba4"
  instance_type = "t2.micro"
  region        = var.region

  tags = {
    Name        = "${var.environment}-EC2-Instance"
    Environment = var.environment
  }
}

output "vpc_id" {
  value = aws_vpc.sample_vpc.id
}

output "ec2_id" {
  value = aws_instance.example.id
}
