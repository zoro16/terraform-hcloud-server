## Description

Terraform module to provision `Server` resource in Hetzner Cloud along with other optional resources e.g. `Snapshot`, `Primary IP` etc.

## Usage

```hcl
provider "hcloud" {
  token = var.hcloud_token
}

# Create and SSH Key with: `ssh-keygen -q -t ed25519 -N '' -f ./tf-example <<<y > /dev/null 2>&1`
resource "hcloud_ssh_key" "key" {
  name       = "tf_key"
  public_key = file("./tf-example.pub")
}

module "sv" {
  source = "../.."

  create_server = true
  server_name   = "example-server"
  server_type   = var.server_type_map.arm64_2_4GB
  location      = "fsn1"
  backups       = true
  image         = "debian-12"

  ssh_keys = [hcloud_ssh_key.key.id]
}

```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.42.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_placement_group.placement](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group) | resource |
| [hcloud_primary_ip.primary](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip) | resource |
| [hcloud_server.server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.server_network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |
| [hcloud_snapshot.snapshot](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/snapshot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_deprecated_images"></a> [allow\_deprecated\_images](#input\_allow\_deprecated\_images) | Enable the use of deprecated images (default: false). Note Deprecated images will be removed after three months. Using them is then no longer possible. | `bool` | `false` | no |
| <a name="input_backups"></a> [backups](#input\_backups) | Whether to enable or disable backups. | `bool` | `true` | no |
| <a name="input_create_placement_group"></a> [create\_placement\_group](#input\_create\_placement\_group) | A boolean to check whether to create a Placement Group resource or not. | `bool` | `false` | no |
| <a name="input_create_primary_ip"></a> [create\_primary\_ip](#input\_create\_primary\_ip) | A boolean to check whether to create a Primary IP resource or not. | `bool` | `false` | no |
| <a name="input_create_server"></a> [create\_server](#input\_create\_server) | A boolean to check whether to create a Server resource or not. | `bool` | `false` | no |
| <a name="input_create_server_network"></a> [create\_server\_network](#input\_create\_server\_network) | A boolean to check whether to create a Server Network resource or not. | `bool` | `false` | no |
| <a name="input_create_snapshot"></a> [create\_snapshot](#input\_create\_snapshot) | A boolean to check whether to create a Snapshot resource or not. | `bool` | `false` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | The datacenter name to create the server in. nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1. The following a mapping for the datacenters and their region | `string` | `null` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable or disable delete protection (Needs to be the same as rebuild\_protection). | `bool` | `false` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | Firewall IDs the server should be attached to on creation. | `list(any)` | `[]` | no |
| <a name="input_ignore_remote_firewall_ids"></a> [ignore\_remote\_firewall\_ids](#input\_ignore\_remote\_firewall\_ids) | Ignores any updates to the `firewall_ids` argument which were received from the server. This should not be used in normal cases. See the documentation of the `hcloud_firewall_attachment` resource for a reason to use this argument. | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | The name of Hcloud OS image e.g. Debain, Ubuntu etc. | `string` | `"debian-12"` | no |
| <a name="input_iso"></a> [iso](#input\_iso) | ID or Name of an ISO image to mount. | `string` | `""` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | If true, do not upgrade the disk. This allows downgrading the server type later. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location name to create the server in. nbg1, fsn1, hel1, ash or hil | `string` | `"fsn1"` | no |
| <a name="input_placement_group_id"></a> [placement\_group\_id](#input\_placement\_group\_id) | Placement Group ID the server added to on creation. | `string` | `null` | no |
| <a name="input_placement_group_labels"></a> [placement\_group\_labels](#input\_placement\_group\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_placement_group_name"></a> [placement\_group\_name](#input\_placement\_group\_name) | Name of the Placement Group to be created. | `string` | `""` | no |
| <a name="input_placement_group_type"></a> [placement\_group\_type](#input\_placement\_group\_type) | Type of the Placement Group to be created. | `string` | `"spread"` | no |
| <a name="input_primary_ip_assignee_id"></a> [primary\_ip\_assignee\_id](#input\_primary\_ip\_assignee\_id) | ID of the assigned resource. | `number` | `null` | no |
| <a name="input_primary_ip_assignee_type"></a> [primary\_ip\_assignee\_type](#input\_primary\_ip\_assignee\_type) | The type of the assigned resource. Currently supported: server | `string` | `"server"` | no |
| <a name="input_primary_ip_auto_delete"></a> [primary\_ip\_auto\_delete](#input\_primary\_ip\_auto\_delete) | Whether auto delete is enabled. Important note:It is recommended to set auto\_delete to false, because if a server assigned to the managed ip is getting deleted, it will also delete the primary IP which will break the TF state. | `bool` | `false` | no |
| <a name="input_primary_ip_datacenter"></a> [primary\_ip\_datacenter](#input\_primary\_ip\_datacenter) | The datacenter name to create the resource in. | `string` | `null` | no |
| <a name="input_primary_ip_delete_protection"></a> [primary\_ip\_delete\_protection](#input\_primary\_ip\_delete\_protection) | Whether delete protection is enabled or not. | `bool` | `false` | no |
| <a name="input_primary_ip_labels"></a> [primary\_ip\_labels](#input\_primary\_ip\_labels) | Description of the Primary IP. | `map(string)` | `{}` | no |
| <a name="input_primary_ip_name"></a> [primary\_ip\_name](#input\_primary\_ip\_name) | Name of the Primary IP. | `string` | `null` | no |
| <a name="input_primary_ip_type"></a> [primary\_ip\_type](#input\_primary\_ip\_type) | Type of the Primary IP. `ipv4` or `ipv6` | `string` | `"ipv4"` | no |
| <a name="input_primary_ipv4"></a> [primary\_ipv4](#input\_primary\_ipv4) | This is static IP that could be assign to any server in the time of server creation or after that. Note that the server and this IP should be in the same region e.g. eu-central | `string` | `null` | no |
| <a name="input_primary_ipv6"></a> [primary\_ipv6](#input\_primary\_ipv6) | This is static IP that could be assign to any server in the time of server creation or after that. Note that the server and this IP should be in the same region e.g. eu-central | `string` | `null` | no |
| <a name="input_public_net_ipv4_enabled"></a> [public\_net\_ipv4\_enabled](#input\_public\_net\_ipv4\_enabled) | Whether to enable or disable a public IPv4 (could be access from the Internet). | `bool` | `true` | no |
| <a name="input_public_net_ipv6_enabled"></a> [public\_net\_ipv6\_enabled](#input\_public\_net\_ipv6\_enabled) | Whether to enable or disable a public IPv6 (could be access from the Internet). | `bool` | `true` | no |
| <a name="input_rebuild_protection"></a> [rebuild\_protection](#input\_rebuild\_protection) | Enable or disable rebuild protection (Needs to be the same as delete\_protection). | `bool` | `false` | no |
| <a name="input_rescue"></a> [rescue](#input\_rescue) | Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32 | `string` | `""` | no |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | ID of the server that already created. | `number` | `null` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the server to create (must be unique per project and a valid hostname as per RFC 1123). | `string` | `"some-server-name"` | no |
| <a name="input_server_network_alias_ips"></a> [server\_network\_alias\_ips](#input\_server\_network\_alias\_ips) | Additional IPs to be assigned to this server. | `list(string)` | `[]` | no |
| <a name="input_server_network_ip"></a> [server\_network\_ip](#input\_server\_network\_ip) | IP to request to be assigned to this server. If you do not provide this then you will be auto assigned an IP address. | `string` | `null` | no |
| <a name="input_server_network_network_id"></a> [server\_network\_network\_id](#input\_server\_network\_network\_id) | ID of the Network which should be added to the Server. Required if `subnet_id` is not set. Successful creation of the resource depends on the existence of a subnet in the Hetzner Cloud Backend. Using `network_id` will not create an explicit dependency between server and subnet. Therefore `depends_on` may need to be used. Alternatively the `subnet_id` property can be used, which will create an explicit dependency between `hcloud_server_network` and the existence of a subnet. | `number` | `null` | no |
| <a name="input_server_network_server_id"></a> [server\_network\_server\_id](#input\_server\_network\_server\_id) | ID of the Server to be attached/linked to the network. | `number` | `null` | no |
| <a name="input_server_network_subnet_id"></a> [server\_network\_subnet\_id](#input\_server\_network\_subnet\_id) | ID of the sub-network which should be added to the Server. Required if `network_id` is not set. Note: if the `ip` property is missing, the Server is currently added to the last created subnet. | `string` | `null` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | (Required, string) Name of the server type this server should be created with. | `string` | `"cx11"` | no |
| <a name="input_snapshot_description"></a> [snapshot\_description](#input\_snapshot\_description) | Description of the snapshot. | `string` | `""` | no |
| <a name="input_snapshot_labels"></a> [snapshot\_labels](#input\_snapshot\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH key IDs or names which should be injected into the server at creation time. | `list(string)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | This could a Bash script or cloud-init configurations that would run the first time the VM is provisioned. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_placement_group_id"></a> [placement\_group\_id](#output\_placement\_group\_id) | Placement Group ID the server added to on creation. |
| <a name="output_placement_group_labels"></a> [placement\_group\_labels](#output\_placement\_group\_labels) | Placement Group ID the server added to on creation. |
| <a name="output_placement_group_name"></a> [placement\_group\_name](#output\_placement\_group\_name) | Name of the Placement Group to be created. |
| <a name="output_placement_group_type"></a> [placement\_group\_type](#output\_placement\_group\_type) | Type of the Placement Group to be created. |
| <a name="output_primary_ip_assignee_id"></a> [primary\_ip\_assignee\_id](#output\_primary\_ip\_assignee\_id) | ID of the assigned resource. |
| <a name="output_primary_ip_assignee_type"></a> [primary\_ip\_assignee\_type](#output\_primary\_ip\_assignee\_type) | The type of the assigned resource. Currently supported: server |
| <a name="output_primary_ip_auto_delete"></a> [primary\_ip\_auto\_delete](#output\_primary\_ip\_auto\_delete) | Whether auto delete is enabled. Important note:It is recommended to set auto\_delete to false, because if a server assigned to the managed ip is getting deleted, it will also delete the primary IP which will break the TF state. |
| <a name="output_primary_ip_datacenter"></a> [primary\_ip\_datacenter](#output\_primary\_ip\_datacenter) | The datacenter name to create the resource in. |
| <a name="output_primary_ip_delete_protection"></a> [primary\_ip\_delete\_protection](#output\_primary\_ip\_delete\_protection) | Whether delete protection is enabled or not. |
| <a name="output_primary_ip_id"></a> [primary\_ip\_id](#output\_primary\_ip\_id) | Unique ID of the Primary IP. |
| <a name="output_primary_ip_ip_address"></a> [primary\_ip\_ip\_address](#output\_primary\_ip\_ip\_address) | IP Address of the Primary IP. |
| <a name="output_primary_ip_ip_network"></a> [primary\_ip\_ip\_network](#output\_primary\_ip\_ip\_network) | IPv6 subnet of the Primary IP for IPv6 addresses. (Only set if type is ipv6) |
| <a name="output_primary_ip_labels"></a> [primary\_ip\_labels](#output\_primary\_ip\_labels) | Description of the Primary IP. |
| <a name="output_primary_ip_name"></a> [primary\_ip\_name](#output\_primary\_ip\_name) | Name of the Primary IP. |
| <a name="output_primary_ip_type"></a> [primary\_ip\_type](#output\_primary\_ip\_type) | Type of the Primary IP. `ipv4` or `ipv6` |
| <a name="output_server_backups"></a> [server\_backups](#output\_server\_backups) | Whether the backups are enabled or not. |
| <a name="output_server_datacenter"></a> [server\_datacenter](#output\_server\_datacenter) | The datacenter that the server is located in. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | Unique ID of the server. |
| <a name="output_server_image"></a> [server\_image](#output\_server\_image) | Name or ID of the image the server was created from. |
| <a name="output_server_ipv4_address"></a> [server\_ipv4\_address](#output\_server\_ipv4\_address) | The IPV4 Address for the VM server |
| <a name="output_server_ipv6_address"></a> [server\_ipv6\_address](#output\_server\_ipv6\_address) | The IPV6 Address for the VM server |
| <a name="output_server_labels"></a> [server\_labels](#output\_server\_labels) | The User-defined labels (key-value pairs) |
| <a name="output_server_location"></a> [server\_location](#output\_server\_location) | The location of the server |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | Name of the server. |
| <a name="output_server_network_alias_ips"></a> [server\_network\_alias\_ips](#output\_server\_network\_alias\_ips) | Additional IPs to be assigned to this server. |
| <a name="output_server_network_id"></a> [server\_network\_id](#output\_server\_network\_id) | ID of the Server Network resource. |
| <a name="output_server_network_ip"></a> [server\_network\_ip](#output\_server\_network\_ip) | IP to request to be assigned to this server. If you do not provide this then you will be auto assigned an IP address. |
| <a name="output_server_network_network_id"></a> [server\_network\_network\_id](#output\_server\_network\_network\_id) | ID of the Network which should be added to the Server. Required if `subnet_id` is not set. Successful creation of the resource depends on the existence of a subnet in the Hetzner Cloud Backend. Using `network_id` will not create an explicit dependency between server and subnet. Therefore `depends_on` may need to be used. Alternatively the `subnet_id` property can be used, which will create an explicit dependency between `hcloud_server_network` and the existence of a subnet. |
| <a name="output_server_network_server_id"></a> [server\_network\_server\_id](#output\_server\_network\_server\_id) | ID of the Server to be attached/linked to the network. |
| <a name="output_server_status"></a> [server\_status](#output\_server\_status) | The status of the server. |
| <a name="output_server_type"></a> [server\_type](#output\_server\_type) | The type of the server. |
| <a name="output_snapshot_description"></a> [snapshot\_description](#output\_snapshot\_description) | The description of the snapshot. |
| <a name="output_snapshot_id"></a> [snapshot\_id](#output\_snapshot\_id) | Unique ID of the snapshot. |
| <a name="output_snapshot_labels"></a> [snapshot\_labels](#output\_snapshot\_labels) | The user-defined labels |
| <a name="output_snapshot_server_id"></a> [snapshot\_server\_id](#output\_snapshot\_server\_id) | The server that the snapshot was created from. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
