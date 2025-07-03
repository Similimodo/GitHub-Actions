terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.41.0"
    }
  }
  required_version = ">=0.14" # This is the terraform version
}

provider "google" {
  project = var.project_id
  region  = var.region
}
