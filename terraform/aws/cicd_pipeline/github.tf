# github_repo.tf (or integrate into an existing file)
resource "github_repository" "source_code" {
  name           = "similimodo-terraform-webserver" # Or your desired repo name
  description    = "Our source code deployed by Terraform"
  visibility     = "public" # or "private"
  # Add other settings like default_branch, topics, etc.
}