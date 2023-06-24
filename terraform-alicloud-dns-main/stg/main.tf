provider "alicloud" {
  region     = var.region
}

locals {
  dns_zone_name = "zeyang.site"
  dns_record    = "stg"
  eip           = "123.123.123.124"
  record_type   = "A"
}

module "mydns" {
  source        = "git::https://jihulab.com/terraform3/module-alicloud-dns.git?ref=v0.0.1"
  dns_zone_name = local.dns_zone_name
  eip           = local.eip
  record_type   = local.record_type
  dns_record    = local.dns_record
}
