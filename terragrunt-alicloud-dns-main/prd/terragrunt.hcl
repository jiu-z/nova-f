include "root" {
    path = find_in_parent_folders()
}

terraform {
    source ="git::https://jihulab.com/terraform3/module-alicloud-dns.git?ref=v0.0.1"
}

inputs = {
    dns_zone_name = "zeyang.site"
    dns_record    = "tgprd"
    eip           = "123.123.123.125"
    record_type   = "A"
}
