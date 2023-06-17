terraform {
  backend "s3" {
    bucket = "adozoo-2023-test-bucket"
    key    = "global/backend/terraform-global.tfstate"
    region = "ap-northeast-1"
  }
}
