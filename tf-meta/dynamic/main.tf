provider "docker" {
  host = "tcp://192.168.1.200:2375"
}

resource "docker_image" "jenkins" {
  name         = "jenkins/jenkins:2.332.2-centos7-jdk8"
  keep_locally = true //销毁时不删除本地镜像
}

locals {
  jenkins_ports = [
    {
      internal = 8080
      external = 8080
    },
    {
      internal = 50000
      external = 50000
    }
  ]
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.name
  name  = "jenkins123"

  dynamic "ports" {
    for_each = local.jenkins_ports
    content {
      internal = ports.value.internal
      external = ports.value.external
      ip       = "0.0.0.0"
      protocol = "tcp"
    }
  }
  #   ports {
  #     internal = 8080
  #     external = 8080
  #     ip = "0.0.0.0"
  #     protocol = "tcp"
  #   }
  #   ports {
  #     internal = 50000
  #     external = 50000
  #     ip = "0.0.0.0"
  #     protocol = "tcp"
  #   }
  volumes {
    container_path = "/var/jenkins_home"
    host_path      = "/data/devops4/jenkins_home"
  }
}