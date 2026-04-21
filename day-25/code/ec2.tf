resource "aws_instance" "example" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t2.micro"

  tags = {
    Name      = "tf-demo"
    ManagedBy = "Terraform"
  }
}
