variable "aws_region" {
  default = "us-east-1"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "ami_id" {
  default = "ami-0866a3c8686eaeeba"


}

variable "aws_access_key" {
  default = ""
}
variable "aws_secret_key" {
  default = ""
}
variable "token" {
  default = ""
  }
