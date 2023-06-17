# demo.zeyang.site
resource "alicloud_dns_record" "record" {
  name        = "zeyang.site"
  host_record = var.dns_record["dev"]
  type        = "A"
  value       = alicloud_instance.myecs.public_ip
}
