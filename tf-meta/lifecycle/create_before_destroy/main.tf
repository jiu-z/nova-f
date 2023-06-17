provider "alicloud" {
  region = "cn-beijing"
}

locals {
  region        = "cn-beijing-b"
  vsw_id        = "vsw-2ze3rlkzrq65vwtmwhjbb"
  secgroup_id   = "sg-2zej4nija106qth48m2k"
  instance_name = "myecsserver1"
  instance_type = "ecs.n1.tiny"
}


data "alicloud_images" "images_ds" {
  owners       = "system"
  name_regex   = "^centos_7_5"
  architecture = "x86_64"
  status       = "Available"
  os_type      = "linux"
  # output_file  = "./outputs.json"
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "myvpc2"
  cidr_block = "172.79.0.0/16"
}

resource "alicloud_instance" "myecs4" {
  availability_zone          = local.region
  security_groups            = [local.secgroup_id]
  instance_type              = local.instance_type
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "tf_system_disk_name"
  system_disk_description    = "tf_system_disk_description"
  image_id                   = data.alicloud_images.images_ds.images[0].id
  instance_name              = local.instance_name
  vswitch_id                 = local.vsw_id
  internet_max_bandwidth_out = 0
  internet_charge_type       = "PayByTraffic"
  password                   = "root@1234"

  tags = {
    env   = "dev"
    owner = "zeyang"
  }

  lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [
      tags,
      instance_name
    ]
    replace_triggered_by = [
      alicloud_vpc.vpc.vpc_name
    ]

    precondition {
      condition     = itself.tags["env"] == "dev"
      error_message = "tags error!"
    }

  }
}