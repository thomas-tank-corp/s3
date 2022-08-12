terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region     = "eu-west2"
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}


module "aws_s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "new"
  acl    = "private"
}


variable "credentials" {
  description = "The credentials for connecting to AWS."
  type = object({
    access_key = string
    secret_key = string
  })
  sensitive = true
}
