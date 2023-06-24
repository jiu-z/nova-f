terraform {
  backend "oss" {
    bucket              = "tf-backend-datas"
    prefix              = "env/dev"
    key                 = "terraform.tfstate"
    region              = "cn-beijing"
    tablestore_endpoint = "https://tftable2023.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "myterraformtable"
  }
}
