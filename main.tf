variable "environment" {}

module "virtual-machine" {
  source  = "app.terraform.io/hashidemos/virtual-machine/vsphere"
  version = "1.0.1"

  app_name    = "ninjas-skunkworks-nginx"
  description = "a skunkworks project"
  environment = var.environment
  owner       = "008103"

  # num_cpus  = "2"
  # memory    = "2048"
  # disk_size = "20"
}

# module "cisco-router" {
#   source  = "app.terraform.io/hashidemos/cloud-router/vsphere"
#   version = "1.0.1"

#   app_name    = "ninjas-skunkworks-router"
#   description = "a skunkworks project"
#   environment = var.environment
#   owner       = "008103"
# }
