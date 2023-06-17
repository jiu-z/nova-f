# demo.zeyang.site
resource "alicloud_dns_record" "record" {
  name        = "zeyang.site"
  host_record = var.dns_record
  type        = "A"
  value       = var.ecs_ip
}
