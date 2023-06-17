provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region = "cn-beijing"
  alias = "beijing"
}

provider "alicloud" {
  region = "cn-shanghai"
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
}

provider "alicloud" {
  alias = "hangzhou"
  region = "cn-hangzhou"
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
}