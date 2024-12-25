resource "google_compute_subnetwork" "app_subnet" {
  name               = "ipv6-subnet"
  project            = var.project
  region             = var.region
  network            = var.network
  ip_cidr_range      = "10.0.0.0/16"    # Dải IPv4 CIDR
  stack_type         = "IPV4_IPV6"      # Hỗ trợ IPv4 và IPv6
  ipv6_access_type   = "EXTERNAL"       # IPv6 công khai
}