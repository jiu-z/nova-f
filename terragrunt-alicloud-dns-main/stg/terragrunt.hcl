include "root" {
    path = find_in_parent_folders()
}

terraform {
    source ="git::https://jihulab.com/terraform3/module-alicloud-dns.git?ref=v0.0.1"
}

inputs = {
    dns_zone_name = "zeyang.site"
    dns_record    = "tgstg"
    eip           = "123.123.123.124"
    record_type   = "A"
}

