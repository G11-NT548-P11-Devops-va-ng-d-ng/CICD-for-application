variable "project" {
  description = "Google Cloud project ID"
  type        = string
}

variable "machine_type" {
  description = "Type of machine for the instances"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "Zone for the instances"
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  description = "Image for the instances"
  type        = string
  default     = "ubuntu-2004-focal-v20201014"
}

variable "network" {
  description = "Network for the instances"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork for the instances"
  type        = string
  default     = "default"
}
variable "be_tags" {
  description = "Tags for the master instance"
  type        = list(string)
  default     = ["backend", "v6"]
}

variable "fe_tags" {
  description = "Tags for the worker instances"
  type        = list(string)
  default     = ["frontend", "v6"]
}