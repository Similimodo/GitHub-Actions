provider "aws" {
  default_tags {
    tags = {
      Environment = "development"
      Project     = "web-server"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}