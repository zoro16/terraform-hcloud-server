terraform {
  required_version = ">= 1.5.4"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.42.1"
    }
  }
}
