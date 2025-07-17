variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "credentials_file" {
  type        = string
  description = "GCP service account credentials in JSON format"
  sensitive   = true
}
