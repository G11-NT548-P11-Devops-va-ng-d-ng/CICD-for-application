variable "project" {
  description = "Google Cloud project ID"
  type        = string
}
variable "region" {
  description = "Region for static IP addresses"
  type        = string
  default     = "us-central1"
}
variable "network" {
  description = "The network to which the firewall rules are applied"
  type        = string
  default     = "default"
}