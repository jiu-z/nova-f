variable "region" {
    type = string
}

variable "env_name" {
    type = list(string)
}

variable "dns_record" {
    type = map(string)
}

variable "ecs_spec" {
    type = list(map(string))
}