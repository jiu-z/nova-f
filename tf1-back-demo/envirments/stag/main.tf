provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = var.region
}

## data source 
data "terraform_remote_state" "mydata" {
  backend  = "oss"
  config   = {
    access_key = "LTAI5tJHLGVvdYjHk5V6BfCH"
    secret_key = "v3vlQPuaB9e7LvzWdXwP4DDU0CdOXl"
    bucket = "terraform-backend-data"
    prefix   = "dev/"
    key   = "terraform-dev.tfstate"
    region = "cn-beijing"
  }
}

output "remote_backend" {
  value = data.terraform_remote_state.mydata
}

resource "alicloud_ots_table" "basic" {
  instance_name = alicloud_ots_instance.tftable.name
  table_name    = "myterraformtable"
  primary_key {
    name = "LockID"
    type = "String"
  }
  time_to_live                  = -1
  max_version                   = 1
  deviation_cell_version_in_sec = 1
}

