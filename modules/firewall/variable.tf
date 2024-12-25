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
  description = "Target tags for SSH firewall rule"
  type        = list(string)
  default     = ["v6"]
}