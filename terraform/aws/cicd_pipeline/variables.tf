# variables.tf
variable "github_token" {
  description = "GitHub Personal Access Token for provider authentication"
  type        = string
  sensitive   = true # Mark as sensitive to prevent it from being shown in plan/apply output
}