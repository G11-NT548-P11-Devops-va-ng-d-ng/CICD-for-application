output "bucket_name" {
  description = "Name of the bucket"
  value       = google_storage_bucket.terraform_state_bucket.name
}