resource "google_storage_bucket" "bucket_discover_paschal" {
  provider = google-beta
  name     = var.bucket_name
  location = "NAM4"

  force_destroy = true

}