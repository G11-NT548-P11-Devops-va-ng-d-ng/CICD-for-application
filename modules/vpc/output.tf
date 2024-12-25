output "vpc_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.app_vpc.id
}
