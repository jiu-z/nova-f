provider "alicloud" {
  region = "cn-beijing"
}

provider "alicloud" {
  alias  = "SH"
  region = "cn-shanghai"
}

module "myvpc" {
  source         = "./vpc"
  vpc_name       = "myvpc1"
  vpc_cidr_block = "172.78.0.0/16"
  providers = {
    alicloud = alicloud.SH
  }
}