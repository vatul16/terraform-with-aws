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
