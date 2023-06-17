terraform {
  backend "oss" {
    access_key = "LTAIV6BfCH"
    secret_key = "v3vlQPXwP4DDU0CdOXl"
    bucket = "terraform-backend-data"
    prefix   = "dev/"
    key   = "terraform-dev.tfstate"
    region = "cn-beijing"
    tablestore_endpoint = "https://tftable.cn-beijing.ots.aliyuncs.com"
    tablestore_table = "myterraformtable"
  }
}
