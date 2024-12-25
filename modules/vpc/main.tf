resource "google_compute_network" "app_vpc" {
  name = "music-app-vpc"
  project      = var.project
  auto_create_subnetworks = false
}