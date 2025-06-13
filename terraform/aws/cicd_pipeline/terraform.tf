
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "terraform-backend-terraformbbackends3bucket-ynqax1cfz9ow"
    key            = "Development"
    region         = "us-east-1"
    dynamodb_table = "terraform-backend-TerraformBackendDynamoDBTable-1MKII9GK8CJ11"
  }
}