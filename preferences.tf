locals {
  env = {
    oke-free = {
      name          = "oke-free"
      compartment   = "kubernetes"
    }

    default = {
      name = "default"
    }
  }
  environmentvars = "${contains(keys(local.env), terraform.workspace)}" ? terraform.workspace : "default"
  workspace       = merge(local.env[terraform.workspace], local.env[local.environmentvars])
}