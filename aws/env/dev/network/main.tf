provider "aws" {
  region = "ap-northeast-1"
}

locals {
  azs         = ["ap-northeast-1a", "ap-northeast-1d"]
  cidr_blocks = ["172.16.10.0/24", "172.16.50.0/24"]
  ports       = ["80", "443", "22"]
}