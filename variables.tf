################################################
# Server
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
################################################

variable "create_server" {
  description = "A boolean to check whether to create a Server resource or not."
  type        = bool
  default     = false
}

variable "server_id" {
  description = "ID of the server that already created."
  type        = number
  default     = null
}

variable "server_name" {
  description = "Name of the server to create (must be unique per project and a valid hostname as per RFC 1123)."
  type        = string
  default     = "some-server-name"
}

variable "datacenter" {
  description = "The datacenter name to create the server in. nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1. The following a mapping for the datacenters and their region"
  type        = string
  default     = null # "fsn1-dc14"

  validation {
    condition     = can(regex("(fsn|nbg|hel|ash|hil)[0-9]*-dc[0-9]*", var.datacenter)) || var.datacenter == null
    error_message = "Must have a vaild datacenter name e.g. `fsn1-dc14`."
  }
}

variable "location" {
  description = "The location name to create the server in. nbg1, fsn1, hel1, ash or hil"
  type        = string
  default     = "fsn1"

  validation {
    condition     = can(regex("(fsn|nbg|hel|ash|hil)[0-9]*", var.location)) || var.location == null
    error_message = "Must have a vaild location name e.g. nbg1, fsn1, hel1, ash or hil."
  }
}

variable "server_type" {
  description = " (Required, string) Name of the server type this server should be created with."
  type        = string
  default     = "cx11"

  validation {
    condition = contains(
      [
        "cx22", "cx32", "cx42", "cx52",                       # Intel
        "cpx11", "cpx21", "cpx31", "cpx41", "cpx51",          # AMD
        "cax11", "cax21", "cax31", "cax41",                   # ARM64
        "ccx13", "ccx23", "ccx33", "ccx43", "ccx53", "ccx63", # Dedicated AMD
      ],
    var.server_type)
    error_message = "Must have a vaild server type name, e.g. cx11"
  }
}

variable "image" {
  description = "The name of Hcloud OS image e.g. Debain, Ubuntu etc."
  type        = string
  default     = "debian-12"
}

variable "public_net_ipv4_enabled" {
  description = "Whether to enable or disable a public IPv4 (could be access from the Internet)."
  type        = bool
  default     = true
}

variable "public_net_ipv6_enabled" {
  description = "Whether to enable or disable a public IPv6 (could be access from the Internet)."
  type        = bool
  default     = true
}

variable "private_network_id" {
  description = "ID of the network the server well be attached."
  type        = number
  default     = null
}

variable "private_network_ip" {
  description = "Specify the IP the server should get in the network."
  type        = string
  default     = null
}

variable "private_network_alias_ips" {
  description = "Alias IPs the server should have in the Network."
  type        = list(string)
  default     = []
}

variable "primary_ipv4" {
  description = "This is static IP that could be assign to any server in the time of server creation or after that. Note that the server and this IP should be in the same region e.g. eu-central"
  type        = string
  default     = null
}

variable "primary_ipv6" {
  description = "This is static IP that could be assign to any server in the time of server creation or after that. Note that the server and this IP should be in the same region e.g. eu-central"
  type        = string
  default     = null
}

variable "user_data" {
  description = "This could a Bash script or cloud-init configurations that would run the first time the VM is provisioned."
  type        = string
  default     = ""
}

variable "keep_disk" {
  description = "If true, do not upgrade the disk. This allows downgrading the server type later."
  type        = bool
  default     = false
}

variable "iso" {
  description = "ID or Name of an ISO image to mount."
  type        = string
  default     = ""
}

variable "backups" {
  description = "Whether to enable or disable backups."
  type        = bool
  default     = true
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}

variable "rescue" {
  description = "Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32"
  type        = string
  default     = ""
}

variable "delete_protection" {
  description = "Enable or disable delete protection (Needs to be the same as rebuild_protection)."
  type        = bool
  default     = false
}

variable "rebuild_protection" {
  description = "Enable or disable rebuild protection (Needs to be the same as delete_protection)."
  type        = bool
  default     = false
}

variable "allow_deprecated_images" {
  description = "Enable the use of deprecated images (default: false). Note Deprecated images will be removed after three months. Using them is then no longer possible."
  type        = bool
  default     = false
}

variable "ignore_remote_firewall_ids" {
  description = "Ignores any updates to the `firewall_ids` argument which were received from the server. This should not be used in normal cases. See the documentation of the `hcloud_firewall_attachment` resource for a reason to use this argument."
  type        = bool
  default     = false
}

variable "shutdown_before_deletion" {
  description = "Whether to try shutting the server down gracefully before deleting it."
  type        = bool
  default     = false
}

variable "firewall_ids" {
  description = "Firewall IDs the server should be attached to on creation."
  type        = list(any)
  default     = []
}


variable "ssh_keys" {
  description = "SSH key IDs or names which should be injected into the server at creation time."
  type        = list(string)
  default     = []
}


################################################
# Placement Group
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group
################################################

variable "create_placement_group" {
  description = "A boolean to check whether to create a Placement Group resource or not."
  type        = bool
  default     = false
}

variable "placement_group_id" {
  description = "Placement Group ID the server added to on creation."
  type        = string
  default     = null
}

variable "placement_group_name" {
  description = "Name of the Placement Group to be created."
  type        = string
  default     = ""
}

variable "placement_group_type" {
  description = "Type of the Placement Group to be created."
  type        = string
  default     = "spread"
}

variable "placement_group_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}


################################################
# Snapshot
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/snapshot
################################################

variable "create_snapshot" {
  description = "A boolean to check whether to create a Snapshot resource or not."
  type        = bool
  default     = false
}

variable "snapshot_description" {
  description = "Description of the snapshot."
  type        = string
  default     = ""
}

variable "snapshot_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}


################################################
# Server Network
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network
################################################

variable "create_server_network" {
  description = "A boolean to check whether to create a Server Network resource or not."
  type        = bool
  default     = false
}

variable "server_network_server_id" {
  description = "ID of the Server to be attached/linked to the network."
  type        = number
  default     = null
}

variable "server_network_network_id" {
  description = "ID of the Network which should be added to the Server. Required if `subnet_id` is not set. Successful creation of the resource depends on the existence of a subnet in the Hetzner Cloud Backend. Using `network_id` will not create an explicit dependency between server and subnet. Therefore `depends_on` may need to be used. Alternatively the `subnet_id` property can be used, which will create an explicit dependency between `hcloud_server_network` and the existence of a subnet."
  type        = number
  default     = null
}

variable "server_network_alias_ips" {
  description = "Additional IPs to be assigned to this server."
  type        = list(string)
  default     = []
}

variable "server_network_subnet_id" {
  description = "ID of the sub-network which should be added to the Server. Required if `network_id` is not set. Note: if the `ip` property is missing, the Server is currently added to the last created subnet."
  type        = string
  default     = null
}

variable "server_network_ip" {
  description = "IP to request to be assigned to this server. If you do not provide this then you will be auto assigned an IP address."
  type        = string
  default     = null
}


################################################
# Primary IP
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip
################################################

variable "create_primary_ip" {
  description = "A boolean to check whether to create a Primary IP resource or not."
  type        = bool
  default     = false
}

variable "primary_ip_name" {
  description = "Name of the Primary IP."
  type        = string
  default     = null
}

variable "primary_ip_datacenter" {
  description = "The datacenter name to create the resource in."
  type        = string
  default     = null

  validation {
    condition     = can(regex("(fsn|nbg|hel|ash|hil)[0-9]*-dc[0-9]*", var.primary_ip_datacenter)) || var.primary_ip_datacenter == null
    error_message = "Must have a vaild datacenter name e.g. `fsn1-dc14`."
  }
}

variable "primary_ip_type" {
  description = "Type of the Primary IP. `ipv4` or `ipv6`"
  type        = string
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], var.primary_ip_type)
    error_message = "Primary IP type could only be `ipv4` or `ipv6`. Please use a valid type."
  }
}

variable "primary_ip_auto_delete" {
  description = "Whether auto delete is enabled. Important note:It is recommended to set auto_delete to false, because if a server assigned to the managed ip is getting deleted, it will also delete the primary IP which will break the TF state."
  type        = bool
  default     = false
}

variable "primary_ip_labels" {
  description = "Description of the Primary IP."
  type        = map(string)
  default     = {}
}

variable "primary_ip_assignee_id" {
  description = "ID of the assigned resource."
  type        = number
  default     = null
}

variable "primary_ip_assignee_type" {
  description = "The type of the assigned resource. Currently supported: server"
  type        = string
  default     = "server"

  validation {
    condition     = contains(["server"], var.primary_ip_assignee_type)
    error_message = "Only `server` Primary IP Assignee Type is supported at this time. Please use a valid primary_ip_assignee_type."
  }
}

variable "primary_ip_delete_protection" {
  description = "Whether delete protection is enabled or not."
  type        = bool
  default     = false
}
