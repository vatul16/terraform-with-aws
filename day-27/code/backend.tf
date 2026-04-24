terraform {
  backend "s3" {
    bucket       = "atul-terraform-state-v1 "
    key          = "terraform/state/main/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}