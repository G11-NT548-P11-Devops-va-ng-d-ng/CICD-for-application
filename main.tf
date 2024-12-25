module "google_provider" {
  source      = "./modules/provider"
  project     = var.project
  region      = "us-central1"
}
terraform {
  backend "gcs" {
    bucket      = "nt548_bucket_state"           # Tên bucket
    prefix      = "terraform/state"              # Đường dẫn lưu trữ trạng thái
  }
}
module "vpc" {
  source       = "./modules/vpc"
  project     = var.project
}
module "subnet" {
  source       = "./modules/subnet"
  project     = var.project
  region      = "us-central1"
  network     = module.vpc.vpc_id
}
module "instance" {
  source               = "./modules/instance"
  project              = var.project
  machine_type         = "e2-medium"
  zone                 = "us-central1-a"
  image                = "ubuntu-2004-focal-v20201014"
  network              = module.vpc.vpc_id
  subnetwork           = module.subnet.subnet_id
  be_tags = ["v4"]
  fe_tags = ["v4", "v6"]
}

module "firewall" {
  source                   = "./modules/firewall"
  project                  = var.project
  network                  = module.vpc.vpc_id
  ipv6_target_tags         = ["v6"]
  ipv4_target_tags         = ["v4"]
}
