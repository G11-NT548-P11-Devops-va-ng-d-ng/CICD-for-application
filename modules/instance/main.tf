resource "google_compute_instance" "be_instance" {
  name         = "app-backend"
  project      = var.project
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    stack_type = "IPV4_IPV6"

    access_config {
      # External IPv4 Address
    }
    ipv6_access_config {
      network_tier = "PREMIUM"
    }
  }

  metadata_startup_script = <<-EOT
  #!/bin/bash
  sudo su
  # Cập nhật hệ thống
  apt update -y
  apt upgrade -y
  apt install -y nodejs npm git nginx curl

  # Gỡ cài đặt Node.js cũ (nếu có)
  apt remove -y nodejs

  # Cài đặt Node.js phiên bản 18
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  apt install -y nodejs

  # Tải resource
  cd /home/ubuntu
  git clone https://github.com/HuyQuahM/Test.git
  cd /home/ubuntu/Test/backend
  npm install
  screen -dmS app npm start

  # Cấu hình Nginx
  cat << 'NGINX' > /etc/nginx/sites-available/music-app
  server {
    listen [::]:80;
    server_name _;

    location / {
        proxy_pass http://[::]:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
  }
  NGINX

  # Kích hoạt Nginx
  ln -s /etc/nginx/sites-available/music-app /etc/nginx/sites-enabled/
  rm /etc/nginx/sites-enabled/default
  systemctl enable nginx
  systemctl restart nginx

  EOT

  tags = var.be_tags
}
resource "google_compute_instance" "fe_instance" {
  name         = "app-frontend"
  project      = var.project
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    stack_type = "IPV4_IPV6"

    access_config {
      # External IPv4 Address
    }
    ipv6_access_config {
      network_tier = "PREMIUM"
    }
  }
  tags = var.fe_tags
}