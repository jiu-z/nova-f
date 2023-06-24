// define provider
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "alicloud" {
}
EOF
}

// define terraform configuration
generate "versions" {
  path = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform { 
  required_version = ">=1.1.8"
  required_providers {
    alicloud = {
      source  = "hashicorp/alicloud"
      version = "1.164.0"
    }
  }
}
EOF
}

// define modules
terraform {
  source ="git::https://jihulab.com/terraform3/module-alicloud-dns.git?ref=v0.0.1"
}

// define backend 
remote_state {
  backend = "oss"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket              = "tf-backend-datas"
    prefix              = "env/${path_relative_to_include()}"
    key                 = "terraform.tfstate"
    region              = "cn-beijing"
    tablestore_endpoint = "https://tftablenew2023.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "myterraformtable"
  }
}
