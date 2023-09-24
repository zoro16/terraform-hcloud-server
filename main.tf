################################################
# Server
################################################

resource "hcloud_server" "server" {
  count = var.create_server ? 1 : 0

  name               = var.server_name
  image              = var.image
  server_type        = var.server_type
  datacenter         = var.datacenter
  location           = var.location
  ssh_keys           = var.ssh_keys
  placement_group_id = var.placement_group_id
  backups            = var.backups
  firewall_ids       = var.firewall_ids
  user_data          = var.user_data

  delete_protection  = var.delete_protection
  rebuild_protection = var.rebuild_protection

  keep_disk = var.keep_disk

  iso                        = var.iso
  rescue                     = var.rescue
  allow_deprecated_images    = var.allow_deprecated_images
  ignore_remote_firewall_ids = var.ignore_remote_firewall_ids

  labels = var.labels

  public_net {
    ipv4_enabled = var.public_net_ipv4_enabled
    ipv6_enabled = var.public_net_ipv6_enabled
    ipv4         = var.primary_ipv4
    ipv6         = var.primary_ipv6
  }
}

################################################
# Placement Group
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group
################################################

resource "hcloud_placement_group" "placement" {
  count = var.create_placement_group ? 1 : 0

  name   = var.placement_group_name
  type   = var.placement_group_type
  labels = var.placement_group_labels
}


################################################
# Snapshot
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/snapshot
################################################

resource "hcloud_snapshot" "snapshot" {
  count = var.create_snapshot ? 1 : 0

  server_id   = var.server_id
  description = var.snapshot_description
  labels      = var.snapshot_labels
}


################################################
# Server Network
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network
################################################

resource "hcloud_server_network" "server_network" {
  count = var.create_server_network ? 1 : 0

  server_id  = var.server_network_server_id
  network_id = var.server_network_network_id
  subnet_id  = var.server_network_subnet_id
  alias_ips  = var.server_network_alias_ips
  ip         = var.server_network_ip
}

################################################
# Primary IP
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip
################################################

resource "hcloud_primary_ip" "primary" {
  count = var.create_primary_ip ? 1 : 0

  name              = var.primary_ip_name
  datacenter        = var.primary_ip_datacenter
  type              = var.primary_ip_type
  assignee_type     = var.primary_ip_assignee_type
  assignee_id       = var.primary_ip_assignee_id
  auto_delete       = var.primary_ip_auto_delete
  labels            = var.primary_ip_labels
  delete_protection = var.primary_ip_delete_protection
}
