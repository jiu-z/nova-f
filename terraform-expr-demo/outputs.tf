output "myregion" {
    value = var.region != "" ? var.region : "shanghai"
}


output "myenv" {
    value = [ for index, value in var.env_name : "${index}-${value}"]
}

output "mydns" {
    value = var.dns_record
  
}

output "ecs_spec" {
    value = var.ecs_spec
}