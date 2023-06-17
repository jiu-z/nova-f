provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = var.region
}

## oss
resource "alicloud_oss_bucket" "tfbucket" {
  bucket = "terraform-backend-data"
  acl    = "private"
}

## tablestore
resource "alicloud_ots_instance" "tftable" {
  name        = "tftable"
  description = "terraform tablestore"
  accessed_by = "Any"
  tags = {
    Created = "TF"
    For     = "Building table"
  }
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


locals {
  region         = "cn-beijing-b"
  vpc_cidr_block = "172.80.0.0/12"
  vsw_cidr_block = "172.80.0.0/21"
  vpc_name       = "myvpcc"
}

module "myvpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = local.vpc_cidr_block
  vsw_cidr_block = local.vsw_cidr_block
  vpc_name       = local.vpc_name
}



module "myssecgroup" {
  source = "../../modules/secgroup"
  vpc_id = module.myvpc.vpc_id
}

module "myecs" {
  source      = "../../modules/ecs"
  region      = local.region
  vsw_id      = module.myvpc.vsw_id
  secgroup_id = module.myssecgroup.secgroup_id
}

module "mydns" {
  source     = "../../modules/dns"
  dns_record = "zeyang"
  ecs_ip     = module.myecs.ecs_ip
}

## data source 
data "terraform_remote_state" "mydata" {
  backend  = "oss"
  config   = {     
    access_key = "LTAI5tJV6BfCH"
    secret_key = "v3vlQPuaBDU0CdOXl"
    bucket = "terraform-backend-data"
    prefix   = "dev/"
    key   = "terraform-dev.tfstate"
    region = "cn-beijing"
  }
}

output "remote_backend" {
  value = data.terraform_remote_state.mydata
}


output "new_bucket_name" {
  value = data.terraform_remote_state.mydata.config.bucket
}

output "new_bucket_name1" {
    value = data.terraform_remote_state.mydata.outputs.bucket_name
}