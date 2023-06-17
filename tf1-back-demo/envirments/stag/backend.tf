terraform {
  backend "oss" {
    access_key = "LTACH"
    secret_key = "v3vlQP0CdOXl"
    bucket = "terraform-backend-data"
    prefix   = "stag/"
    key   = "terraform-stag.tfstate"
    region = "cn-beijing"
    tablestore_endpoint = "https://tftable.cn-beijing.ots.aliyuncs.com"
    tablestore_table = "myterraformtable"
  }
}
