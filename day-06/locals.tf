locals {
  bucket_name = "${var.my_name}-learning-terraform-v1-${var.environment}"
  vpc_name    = "${var.environment}-VPC"
}
