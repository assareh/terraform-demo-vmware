module "virtual-machine" {
  source  = "app.terraform.io/hashidemos/virtual-machine/vsphere"
  version = "0.1.2"

  app_name    = "ninjas-skunkworks-nginx"
  description = "a skunkworks project"
  environment = var.environment
  owner       = "008103"
}

variable "environment" {}

output "name" { value = module.virtual-machine.name }
output "ssh_ip" { value = module.virtual-machine.ssh_addr }
