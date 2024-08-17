# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

locals {
  app_name = "example-server"
  subnet   = "10.10.20.0/24"

  multiple_instances = {
    "1" = {
      server_type = var.server_type_map.x86_2_4GB
      location    = "hel1"
      image       = "debian-12"
      private_ip  = "10.10.20.3"
    }
    "2" = {
      server_type = var.server_type_map.x86_2_4GB
      location    = "fsn1"
      image       = "debian-12"
      private_ip  = "10.10.20.4"
    }
    "3" = {
      server_type = var.server_type_map.x86_2_4GB
      location    = "nbg1"
      image       = "alma-9"
      private_ip  = "10.10.20.5"
    }
  }
}

module "net" {
  source  = "zoro16/network/hcloud"
  version = "1.1.2"

  create_network                   = true
  network_name                     = "example-network-server"
  network_ip_cidr_range            = "10.10.0.0/16"
  network_delete_protection        = false
  network_expose_routes_to_vswitch = false
  network_labels = {
    name        = "example-network-server"
    environment = "dev"
  }

  create_subnet         = true
  subnet_type           = "cloud"
  subnet_network_zone   = "eu-central"
  subnet_ip_cidr_ranges = [local.subnet]
}

module "placement_group" {
  source  = "zoro16/server/hcloud"
  version = "1.2.2"

  create_placement_group = true
  placement_group_name   = "${local.app_name}-placement-group"
  placement_group_type   = "spread"
}

# Create and SSH Key with: `ssh-keygen -q -t ed25519 -N '' -f ./tf-example <<<y > /dev/null 2>&`
resource "hcloud_ssh_key" "key" {
  name       = "tf_net_server_example"
  public_key = file("../tf-example.pub")
}

module "sv" {
  source = "../.."

  create_server = true

  for_each    = local.multiple_instances
  server_name = "${local.app_name}-${each.key}"


  private_network_id      = module.net.network_id
  private_network_ip      = each.value.private_ip
  public_net_ipv4_enabled = true
  public_net_ipv6_enabled = true

  server_type = each.value.server_type
  location    = each.value.location
  backups     = false
  image       = each.value.image
  keep_disk   = true

  placement_group_id = module.placement_group.placement_group_id
  # firewall_ids = [data.hcloud_firewall.firewall.id]
  ignore_remote_firewall_ids = true
  rebuild_protection         = false
  delete_protection          = false
  ssh_keys                   = [hcloud_ssh_key.key.id]

  labels = {
    "name" : "${local.app_name}-${each.key}",
    "environment" : "demo",
    "created_by" : "terraform"
  }

  depends_on = [
    module.net
  ]
}
