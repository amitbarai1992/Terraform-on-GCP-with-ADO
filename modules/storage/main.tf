resource "google_storage_bucket" "bucket" {
  name     = var.project_id
  location = "US"
}
