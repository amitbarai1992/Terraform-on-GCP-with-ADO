resource "google_storage_bucket" "gcs_bucket" {
  name                        = "gcs-bucket-${var.project_id}"
  location                    = "us-central1"
  storage_class               = "STANDARD"
  versioning {
    enabled = false
  }
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    "created-by" = "ADO-Terraform"
    "environment" = "test"
  }
}