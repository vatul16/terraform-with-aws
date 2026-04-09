terraform {
  backend "s3" {
    bucket       = "atul-terraform-state-v1"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
