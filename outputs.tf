################################################
# Server
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
################################################

output "server_status" {
  description = "The status of the server."
  value       = try(hcloud_server.server[0].status, hcloud_server.server[*].status, "")
}

output "server_id" {
  description = "Unique ID of the server."
  value       = try(hcloud_server.server[0].id, hcloud_server.server[*].id, "")
}

output "server_name" {
  description = "Name of the server."
  value       = try(hcloud_server.server[0].name, hcloud_server.server[*].name, "")
}

output "server_type" {
  description = "The type of the server."
  value       = try(hcloud_server.server[0].server_type, hcloud_server.server[*].server_type, "")
}

output "server_image" {
  description = "Name or ID of the image the server was created from."
  value       = try(hcloud_server.server[0].image, hcloud_server.server[*].image, "")
}

output "server_location" {
  description = "The location of the server"
  value       = try(hcloud_server.server[0].location, hcloud_server.server[*].location, "")
}

output "server_datacenter" {
  description = "The datacenter that the server is located in."
  value       = try(hcloud_server.server[0].datacenter, hcloud_server.server[*].datacenter, "")
}

output "server_ipv4_address" {
  description = "The IPV4 Address for the VM server"
  value       = try(hcloud_server.server[0].ipv4_address, hcloud_server.server[*].ipv4_address)
}

output "server_ipv6_address" {
  description = "The IPV6 Address for the VM server"
  value       = try(hcloud_server.server[0].ipv6_address, hcloud_server.server[*].ipv6_address)
}

# output "server_backup_window" {
#   description = "The backup window of the server, if enabled"
#   value       = try(hcloud_server.server.0.backup_window, hcloud_server.server.*.backup_window, "")
# }

output "server_backups" {
  description = "Whether the backups are enabled or not."
  value       = try(hcloud_server.server[0].backups, hcloud_server.server[*].backups)
}

output "server_labels" {
  description = "The User-defined labels (key-value pairs)"
  value       = try(hcloud_server.server[0].labels, hcloud_server.server[*].labels)
}

################################################################
output "server_private_network" {
  description = "Private Network the server shall be attached to. The Network that should be attached to the server requires at least one subnetwork. Subnetworks cannot be referenced by Servers in the Hetzner Cloud API. Therefore Terraform attempts to create the subnetwork in parallel to the server. This leads to a concurrency issue. It is therefore necessary to use depends_on to link the server to the respective subnetwork. See examples."
  value       = try(hcloud_server.server[0].network, hcloud_server.server[*].network)
}

output "server_private_network_ip" {
  description = "Private Network IPs"
  value = toset([
    for v in hcloud_server.server[0].network : v.ip
  ])
}

output "server_private_network_id" {
  description = "Private Network IDs"
  value = toset([
    for v in hcloud_server.server[0].network : v.network_id
  ])
}

output "server_private_network_alias_ips" {
  description = "Private Network Alias IPs"
  value = toset([
    for v in hcloud_server.server[0].network : v.alias_ips
  ])
}

output "server_private_network_mac_address" {
  description = "Private Network MAC Address'"
  value = toset([
    for v in hcloud_server.server[0].network : v.mac_address
  ])
}

################################################################
output "server_firewall_ids" {
  description = "Firewall IDs the server is attached to."
  value       = try(hcloud_server.server[0].firewall_ids, hcloud_server.server[*].firewall_ids)
}

output "server_delete_protection" {
  description = "Whether delete protection is enabled."
  value       = try(hcloud_server.server[0].delete_protection, hcloud_server.server[*].delete_protection)
}

output "server_rebuild_protection" {
  description = "Whether rebuild protection is enabled."
  value       = try(hcloud_server.server[0].rebuild_protection, hcloud_server.server[*].rebuild_protection)
}

output "server_shutdown_before_deletion" {
  description = "Whether the server will try to shut down gracefully before being deleted."
  value       = try(hcloud_server.server[0].shutdown_before_deletion, hcloud_server.server[*].shutdown_before_deletion)
}


################################################
# Placement Group
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group
################################################


output "placement_group_id" {
  description = "Placement Group ID the server added to on creation."
  value       = try(hcloud_placement_group.placement[0].id, hcloud_placement_group.placement[*].id, "")
}

output "placement_group_name" {
  description = "Name of the Placement Group to be created."
  value       = try(hcloud_placement_group.placement[0].name, hcloud_placement_group.placement[*].name, "")
}

output "placement_group_type" {
  description = "Type of the Placement Group to be created."
  value       = try(hcloud_placement_group.placement[0].type, hcloud_placement_group.placement[*].type, "")
}

output "placement_group_labels" {
  description = "Placement Group ID the server added to on creation."
  value       = try(hcloud_placement_group.placement[0].labels, hcloud_placement_group.placement[*].labels, "")
}

################################################
# Snapshot
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/snapshot
################################################

output "snapshot_id" {
  description = "Unique ID of the snapshot."
  value       = try(hcloud_snapshot.snapshot[0].id, hcloud_snapshot.snapshot[*].id, null)
}

output "snapshot_server_id" {
  description = "The server that the snapshot was created from."
  value       = try(hcloud_snapshot.snapshot[0].server_id, hcloud_snapshot.snapshot[*].server_id, null)
}

output "snapshot_description" {
  description = "The description of the snapshot."
  value       = try(hcloud_snapshot.snapshot[0].description, hcloud_snapshot.snapshot[*].description, null)
}

output "snapshot_labels" {
  description = "The user-defined labels"
  value       = try(hcloud_snapshot.snapshot[0].labels, hcloud_snapshot.snapshot[*].labels, null)
}

################################################
# Primary IP
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip
################################################


output "primary_ip_id" {
  description = "Unique ID of the Primary IP."
  value       = try(hcloud_primary_ip.primary[0].id, hcloud_primary_ip.primary[*].id)
}

output "primary_ip_name" {
  description = "Name of the Primary IP."
  value       = try(hcloud_primary_ip.primary[0].name, hcloud_primary_ip.primary[*].name)
}

output "primary_ip_datacenter" {
  description = "The datacenter name to create the resource in."
  value       = try(hcloud_primary_ip.primary[0].datacenter, hcloud_primary_ip.primary[*].datacenter)
}

output "primary_ip_type" {
  description = "Type of the Primary IP. `ipv4` or `ipv6`"
  value       = try(hcloud_primary_ip.primary[0].type, hcloud_primary_ip.primary[*].type)
}

output "primary_ip_auto_delete" {
  description = "Whether auto delete is enabled. Important note:It is recommended to set auto_delete to false, because if a server assigned to the managed ip is getting deleted, it will also delete the primary IP which will break the TF state."
  value       = try(hcloud_primary_ip.primary[0].auto_delete, hcloud_primary_ip.primary[*].auto_delete)
}

output "primary_ip_labels" {
  description = "Description of the Primary IP."
  value       = try(hcloud_primary_ip.primary[0].labels, hcloud_primary_ip.primary[*].labels)
}

output "primary_ip_ip_address" {
  description = "IP Address of the Primary IP."
  value       = try(hcloud_primary_ip.primary[0].ip_address, hcloud_primary_ip.primary[*].ip_address)
}

output "primary_ip_ip_network" {
  description = "IPv6 subnet of the Primary IP for IPv6 addresses. (Only set if type is ipv6)"
  value       = try(hcloud_primary_ip.primary[0].ip_network, hcloud_primary_ip.primary[*].ip_network)
}

output "primary_ip_assignee_id" {
  description = "ID of the assigned resource."
  value       = try(hcloud_primary_ip.primary[0].assignee_id, hcloud_primary_ip.primary[*].assignee_id)
}

output "primary_ip_assignee_type" {
  description = "The type of the assigned resource. Currently supported: server"
  value       = try(hcloud_primary_ip.primary[0].assignee_type, hcloud_primary_ip.primary[*].assignee_type)
}

output "primary_ip_delete_protection" {
  description = "Whether delete protection is enabled or not."
  value       = try(hcloud_primary_ip.primary[0].delete_protection, hcloud_primary_ip.primary[*].delete_protection)
}
