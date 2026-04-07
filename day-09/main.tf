resource "aws_instance" "example" {
  # ami           = "ami-01b14b7ad41e17ba4"
  ami           = "ami-0ff8a91507f77f867"
  instance_type = var.allowed_vm_type[1]
  region        = var.region

  tags = var.tags

  lifecycle {
    create_before_destroy = false
    prevent_destroy = false
  }
}
