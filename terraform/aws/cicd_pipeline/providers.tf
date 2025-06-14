# providers.tf
provider "github" {
  token = var.github_pat_value
}