resource "google_storage_bucket" "terraform_state_bucket" {
  name          = "terraform-state-bucket"
  project       = var.project
  location      = "US"
  force_destroy = true  # Cho phép xóa bucket khi cần thiết
  uniform_bucket_level_access = true  # Đảm bảo bucket có quyền truy cập đồng nhất
}
