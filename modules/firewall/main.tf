resource "google_compute_firewall" "allow_ipv6" {
  name    = "allow-ipv6"
  project = var.project
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  direction     = "INGRESS"
  source_ranges = ["::/0"] # Cho phép tất cả IPv6
  target_tags   = var.ipv6_target_tags
}
resource "google_compute_firewall" "allow_ipv4" {
  name    = "allow-ipv4"
  project = var.project
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"] # Cho phép tất cả IPv4
  target_tags   = var.ipv4_target_tags
}