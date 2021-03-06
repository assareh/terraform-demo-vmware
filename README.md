# terraform-demo-vmware

## Prerequisites
1. Workspaces created and VCS connections in place on workspaces as follows:
![demo-diagram](./demo-diagram.png)
*Test workspace for CLI driven flow with remote backend is optional.*
2. Make sure tfc-agent(s) are running as appropriate.
3. Make sure main.tf is blank in dev and main branches.
4. Open incognito browser window and sign in to GitHub as developer user.
5. Open browser window signed in to Terraform Cloud as myself.

## Demo Script
1. old way (google it) vs new way (go to PMR) -- sign in as dev using SSO
2. select module
3. go to github and show bare repo (this can be auto generated, repo, workspace as a service. put short lived creds in here as well)
4. edit main.tf 9 lines and boom, commit to dev. (this is important because it enables you to map from the changes in git to how it will impact the real life infra)
5. while it’s provisioning show:
* workspaces
* run history
* state history + diffs
* variables
* RBAC
6. now open PR, show speculative plan
7. show and explain sentinel policy as code
8. merge PR, show plans queued in both stage and prod
9. review and apply stage, then later review and apply prod
10. increase CPU, RAM, and/or Disk and repeat
11. destroy from GUI (API script if needed is `~/Developer/destroy.sh hashidemos a-tf-demo-vmware-TEST`)

### Sentinel Failures
* \> 4 CPUs
* \> 8GB RAM
* 100GB disk

## Completed Code
For **Edinburgh** use `1.0.1`.

```
module "virtual-machine" {
  source  = "app.terraform.io/hashidemos/virtual-machine/vsphere"
  version = "1.0.1"

  app_name    = "ninjas-skunkworks-nginx"
  description = "a skunkworks project"
  environment = var.environment
  owner       = "008103"

  # num_cpus  = "4"
  # memory    = "8192"
  # disk_size = "100"
}

variable "environment" {}

output "name" { value = module.virtual-machine.name }
output "http_ip" { value = module.virtual-machine.http_addr }
output "ssh_ip" { value = module.virtual-machine.ssh_addr }
```

## Futures
* adapt/complete the workspaces code from `vsphere-workspaces`
