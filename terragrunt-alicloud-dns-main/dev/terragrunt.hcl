include "root" {
  path = find_in_parent_folders()
}

inputs = {
  dns_zone_name = "zeyang.site"
  dns_record    = "tgdev"
  eip           = "123.123.123.123"
  record_type   = "A"
}
