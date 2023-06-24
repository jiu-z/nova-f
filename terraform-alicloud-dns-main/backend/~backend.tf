terraform {
  backend "oss" {
    bucket              = "tf-backend-datas"
    prefix              = "global/backend"
    key                 = "terraform-global-backend.tfstate"
    region              = "cn-beijing"
    tablestore_endpoint = "https://tftablenew.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "myterraformtable"
  }
}
