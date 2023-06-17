provider "alicloud" {
  region = "cn-beijing"
}

locals {
  zone    = "zeyang.site"
  records = ["server1", "server2", "server3"]
  #records = ["server1","server3"]
}

resource "alicloud_dns_record" "record" {
  count       = length(local.records)
  name        = local.zone
  host_record = local.records[count.index]
  type        = "A"
  value       = "192.168.1.1"
}