locals {
  zone    = "zeyang.site"
  #records = ["server1", "server2", "server3"]
  records = ["server1","server3"]
}

resource "alicloud_dns_record" "eachrecord" {
  for_each    = toset(local.records)
  name        = local.zone
  host_record = each.value
  type        = "A"
  value       = "192.168.1.1"
}