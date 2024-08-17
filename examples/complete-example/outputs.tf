################################################
# Server
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
################################################

output "server_status" {
  description = "The status of the server."
  value = {
    for k, v in module.sv : v.server_name => v.server_status
  }
}

output "server_id" {
  description = "Unique ID of the server."
  value = {
    for k, v in module.sv : v.server_name => v.server_id
  }
}

output "server_name" {
  description = "Name of the server."
  value = {
    for k, v in module.sv : v.server_name => v.server_name
  }
}

output "server_type" {
  description = "The type of the server."
  value = {
    for k, v in module.sv : v.server_name => v.server_type
  }
}

output "server_image" {
  description = "Name or ID of the image the server was created from."
  value = {
    for k, v in module.sv : v.server_name => v.server_image
  }
}

output "server_location" {
  description = "The location of the server"
  value = {
    for k, v in module.sv : v.server_name => v.server_location
  }
}

output "server_datacenter" {
  description = "The datacenter that the server is located in."
  value = {
    for k, v in module.sv : v.server_name => v.server_datacenter
  }
}

output "server_ipv4_address" {
  description = "The IPV4 Address for the VM server"
  value = {
    for k, v in module.sv : v.server_name => v.server_ipv4_address
  }
}

output "server_ipv6_address" {
  description = "The IPV6 Address for the VM server"
  value = {
    for k, v in module.sv : v.server_name => v.server_ipv6_address
  }
}

# # output "server_backup_window" {
# #   description = "The backup window of the server, if enabled"
# #   value       = try(module.sv.0.backup_window, module.sv.*.backup_window, "")
# # }

output "server_backups" {
  description = "Whether the backups are enabled or not."
  value = {
    for k, v in module.sv : v.server_name => v.server_backups
  }
}

output "server_labels" {
  description = "The User-defined labels (key-value pairs)"
  value = {
    for k, v in module.sv : v.server_name => v.server_labels
  }
}

output "server_private_network_ip" {
  description = "Private Network IP"
  value = {
    for k, v in module.sv : v.server_name => v.server_private_network_ip
  }
}

output "server_private_network_id" {
  description = "Private Network IDs"
  value = {
    for k, v in module.sv : v.server_name => v.server_private_network_id
  }
}

output "server_private_network_alias_ips" {
  description = "Private Network Alias IPs"
  value = {
    for k, v in module.sv : v.server_name => v.server_private_network_alias_ips
  }
}

output "server_private_network_mac_address" {
  description = "Private Network MAC Address'"
  value = {
    for k, v in module.sv : v.server_name => v.server_private_network_mac_address
  }
}
