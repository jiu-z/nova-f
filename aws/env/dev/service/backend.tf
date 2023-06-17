terraform {
  backend "s3" {
    bucket = "adozoo-2023-test-bucket"
    key    = "env/dev/service/terraform-service.tfstate"
    region = "ap-northeast-1"
  }
}
