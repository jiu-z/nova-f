# module-alicloud-dns

This module is for my test.


## Used

```
locals {
  dns_zone_name = "zeyang.site"
  dns_record    = "deva"
  eip           = module.dev-eip.eip
  record_type   = "A"
}

module "mydns" {
  source        = "git::https://jihulab.com/terraform3/module-alicloud-dns.git?ref=v0.0.1"
  dns_zone_name = local.dns_zone_name
  eip           = local.eip
  record_type   = local.record_type
  dns_record    = local.dns_record
}
```
