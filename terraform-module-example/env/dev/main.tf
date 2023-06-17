provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region = var.region
}

locals {
  region         = "cn-beijing-b"
  vpc_cidr_block = "172.80.0.0/12"
  vsw_cidr_block = "172.80.0.0/21"
  vpc_name       = "myvpc"
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