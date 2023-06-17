locals {
  ecs_name = "myecs"
}


data "alicloud_images" "images_ds" {
  owners       = "system"
  name_regex   = "^centos_6_10"
  architecture = "x86_64"
  status       = "Available"
  os_type      = "linux"
  output_file  = "./outputs.json"
}

resource "alicloud_instance" "myecs" {
  availability_zone          = var.region
  security_groups            = [var.secgroup_id]
  instance_type              = "ecs.n1.tiny"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "tf_system_disk_name"
  system_disk_description    = "tf_system_disk_description"
  image_id                   = data.alicloud_images.images_ds.images[0].id
  instance_name              = local.ecs_name
  vswitch_id                 = var.vsw_id
  internet_max_bandwidth_out = 1
  internet_charge_type       = "PayByTraffic"
  password                   = "root@123"
}