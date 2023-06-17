output "dev_dns_name" {
  value = alicloud_dns_record.record.host_record
}
output "my_env" {
  value = var.env_list[0]
  sensitive = true
}