output "subnet_id" {
  description = "ID of the Subnetwork"
  value       = google_compute_subnetwork.app_subnet.id
}