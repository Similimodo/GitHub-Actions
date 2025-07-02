variable "region" {
  type        = string
  description = "Default GCP region (not used for bucket itself)"
  default     = "us-central1"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "bucket_name" {
  type        = string
  description = "Globally unique name for the GCS bucket"
}