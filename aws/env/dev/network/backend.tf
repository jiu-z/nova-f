terraform {
  backend "s3" {
    bucket = "adozoo-2023-test-bucket"
    key    = "env/dev/network/terraform-network.tfstate"
    region = "ap-northeast-1"
  }
}
