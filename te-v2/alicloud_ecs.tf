data "alicloud_images" "images_ds" {
  owners     = "system"
  name_regex = "^centos_6_10"
  architecture = "x86_64"
  status = "Available"
  os_type = "linux"
  output_file = "./outputs.json"
}

output "image_name" {
  value = data.alicloud_images.images_ds.images[0].id
}

locals{
  ecs_name = "zeyang-ecs"
}

resource "alicloud_instance" "myecs" {
  provider = alicloud.beijing
  availability_zone          = var.region
  security_groups            = alicloud_security_group.group.*.id
  instance_type              = "ecs.n1.tiny"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "tf_system_disk_name"
  system_disk_description    = "tf_system_disk_description"
  image_id                   = data.alicloud_images.images_ds.images[0].id
  //instance_name              = var.ecs_info["ecs_name"]
  instance_name              = local.ecs_name
  vswitch_id                 = alicloud_vswitch.vsw.id
  internet_max_bandwidth_out = 1
  internet_charge_type       = "PayByTraffic"
  password                   = "root@123"
}
