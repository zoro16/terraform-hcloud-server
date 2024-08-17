# complete-example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.48.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_net"></a> [net](#module\_net) | zoro16/network/hcloud | 1.1.2 |
| <a name="module_placement_group"></a> [placement\_group](#module\_placement\_group) | zoro16/server/hcloud | 1.2.2 |
| <a name="module_sv"></a> [sv](#module\_sv) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [hcloud_ssh_key.key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud API Token | `string` | n/a | yes |
| <a name="input_server_type_map"></a> [server\_type\_map](#input\_server\_type\_map) | This is a mapping for Hcloud's server types. The `key` is a combination of `[Processor Architecture]_[Number of vCores]_[RAM size]`. The `value` is Hcloud server type name. | `map(string)` | <pre>{<br>  "arm64_16_32GB": "cax41",<br>  "arm64_2_4GB": "cax11",<br>  "arm64_4_8GB": "cax21",<br>  "arm64_8_16GB": "cax31",<br>  "x86_16_32GB": "cpx51",<br>  "x86_16_64GB_dedicated": "ccx43",<br>  "x86_2_2GB": "cpx11",<br>  "x86_2_4GB": "cx22",<br>  "x86_2_8GB_dedicated": "ccx13",<br>  "x86_32_128GB_dedicated": "ccx53",<br>  "x86_3_4GB": "cpx21",<br>  "x86_48_192GB_dedicated": "ccx63",<br>  "x86_4_16GB_dedicated": "ccx23",<br>  "x86_4_8GB": "cpx31",<br>  "x86_8_16GB": "cpx41",<br>  "x86_8_32GB_dedicated": "ccx33"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_backups"></a> [server\_backups](#output\_server\_backups) | Whether the backups are enabled or not. |
| <a name="output_server_datacenter"></a> [server\_datacenter](#output\_server\_datacenter) | The datacenter that the server is located in. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | Unique ID of the server. |
| <a name="output_server_image"></a> [server\_image](#output\_server\_image) | Name or ID of the image the server was created from. |
| <a name="output_server_ipv4_address"></a> [server\_ipv4\_address](#output\_server\_ipv4\_address) | The IPV4 Address for the VM server |
| <a name="output_server_ipv6_address"></a> [server\_ipv6\_address](#output\_server\_ipv6\_address) | The IPV6 Address for the VM server |
| <a name="output_server_labels"></a> [server\_labels](#output\_server\_labels) | The User-defined labels (key-value pairs) |
| <a name="output_server_location"></a> [server\_location](#output\_server\_location) | The location of the server |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | Name of the server. |
| <a name="output_server_private_network_alias_ips"></a> [server\_private\_network\_alias\_ips](#output\_server\_private\_network\_alias\_ips) | Private Network Alias IPs |
| <a name="output_server_private_network_id"></a> [server\_private\_network\_id](#output\_server\_private\_network\_id) | Private Network IDs |
| <a name="output_server_private_network_ip"></a> [server\_private\_network\_ip](#output\_server\_private\_network\_ip) | Private Network IP |
| <a name="output_server_private_network_mac_address"></a> [server\_private\_network\_mac\_address](#output\_server\_private\_network\_mac\_address) | Private Network MAC Address' |
| <a name="output_server_status"></a> [server\_status](#output\_server\_status) | The status of the server. |
| <a name="output_server_type"></a> [server\_type](#output\_server\_type) | The type of the server. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
