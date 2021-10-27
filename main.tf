terraform {
  # required_version = "~> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-west-2"
}
terraform {
   backend "s3" {
     bucket = "example-terraform--name-bootstrap-terraform-state"
     key    = "default-infrastructure"
     region = "us-west-2"
   }
 }

resource "aws_s3_bucket" "terraform_state" {
  bucket = "example-terraform--name-bootstrap-terraform-state"

  versioning {
    enabled = true
    
  }
}

