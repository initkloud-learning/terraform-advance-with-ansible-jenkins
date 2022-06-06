terraform {
  required_version = "~> 1.2.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.1"
    }
  }

  backend "s3" {
    bucket  = "initkloud-dev-bucket"
    key     = "initkloud-dev/terraform.tfstate"
    region  = "us-east-1"
    profile = "terraform-initkloud-dev"
  }
}

