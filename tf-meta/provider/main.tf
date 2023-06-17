provider "alicloud" {
  region = "cn-beijing"
}

provider "alicloud" {
  alias  = "SH"
  region = "cn-shanghai"
}

//vpc专有网络
resource "alicloud_vpc" "vpc" {
  vpc_name   = "myvpc1"
  cidr_block = "172.79.0.0/16"
}

resource "alicloud_vpc" "vpc2" {
  provider   = alicloud.SH
  vpc_name   = "myvpc2"
  cidr_block = "172.79.0.0/16"
}
