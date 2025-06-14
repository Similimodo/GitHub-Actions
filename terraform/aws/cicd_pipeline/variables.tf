variable "github_pat_value" {
  description = "GitHub Personal Access Token for CodeBuild to access private repositories."
  type        = string
  sensitive   = true # IMPORTANT: Mark as sensitive so it's not exposed in logs or state file outputs.
}

# Add other necessary variables if you don't have them
variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1" # Or your desired default region
}

variable "aws_account_id" {
  description = "The AWS account ID."
  type        = string
}