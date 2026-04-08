variable "project_name" {
  default = "Project ALPHA Resource"
}

variable "default_tags" {
  default = {
    company    = "TechCorp"
    managed_by = "terraform"
  }
}

variable "environment_tags" {
  default = {
    environment = "production"
    cost_center = "cc-123"
  }
}

variable "bucket_name" {
  default = "ProjectAlpaStorageBucket with CAPS and spaces!!!"
}

variable "allowed_ports" {
  default = "80,443,8080,3306"
}

variable "environment" {
  default = "prod"
}

variable "instance_sizes" {
  default = {
    dev     = "t2.micro"
    staging = "t3.small"
    prod    = "t3.large"
  }
}
