variable "network" {
  description = "The network to which the firewall rules are applied"
  type        = string
  default     = "default"
}
variable "project" {
  description = "Google Cloud project ID"
  type        = string
}
variable "ipv6_target_tags" {
  description = "Target tags for port 443, 80, 22 firewall rule"
  type        = list(string)
  default     = ["v6"]
}
variable "ipv4_target_tags" {
  description = "Target tags for port 443, 80, 22 firewall rule"
  type        = list(string)
  default     = ["v4"]
}