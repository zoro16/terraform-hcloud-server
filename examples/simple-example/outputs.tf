################################################
# Server
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
################################################

output "server_status" {
  description = "The status of the server."
  value       = module.sv.server_status
}

output "server_id" {
  description = "Unique ID of the server."
  value       = module.sv.server_id
}

output "server_name" {
  description = "Name of the server."
  value       = module.sv.server_name
}

output "server_type" {
  description = "The type of the server."
  value       = module.sv.server_type
}

output "server_image" {
  description = "Name or ID of the image the server was created from."
  value       = module.sv.server_image
}

output "server_location" {
  description = "The location of the server"
  value       = module.sv.server_location
}

output "server_datacenter" {
  description = "The datacenter that the server is located in."
  value       = module.sv.server_datacenter
}

output "server_ipv4_address" {
  description = "The IPV4 Address for the VM server"
  value       = module.sv.server_ipv4_address
  # {
  #   for ipv4 in module.sv : ipv4.name => ipv4.ipv4_address
  # }
}

output "server_ipv6_address" {
  description = "The IPV6 Address for the VM server"
  value       = module.sv.server_ipv6_address
  # {
  #   for ipv6 in module.sv : ipv6.name => ipv6.ipv6_address
  # }
}

# output "server_backup_window" {
#   description = "The backup window of the server, if enabled"
#   value       = try(module.sv.0.backup_window, module.sv.*.backup_window, "")
# }

output "server_backups" {
  description = "Whether the backups are enabled or not."
  value       = module.sv.server_backups
}

output "server_labels" {
  description = "The User-defined labels (key-value pairs)"
  value       = module.sv.server_labels
}
