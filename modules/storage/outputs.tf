output "bucket_name" {
  # value = google_storage_bucket.bucket.name
  value = google_storage_bucket.gcs_bucket.name
}
