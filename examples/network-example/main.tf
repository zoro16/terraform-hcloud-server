# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create and SSH Key with: `ssh-keygen -q -t ed25519 -N '' -f ./tf-example <<<y > /dev/null 2>&`
resource "hcloud_ssh_key" "key" {
  name       = "tf_net_server_example"
  public_key = file("./tf-example.pub")
}

module "net" {
  source = "zoro16/network/hcloud"
  version = "1.0.0"

  create_network = true
  network_name                     = "example-network-server"
  network_ip_cidr_range            = "10.10.0.0/16"
  network_delete_protection        = false
  network_expose_routes_to_vswitch = false
  network_labels = {
    name        = "example-network-server"
    environment = "dev"
  }

  create_subnet        = true
  subnet_network_id    = module.net.network_id
  subnet_type          = "cloud"
  subnet_network_zone  = "eu-central"
  subnet_ip_cidr_range = "10.10.20.0/24"
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

  private_network_id = module.net.network_id
  private_network_ip = "10.10.20.1"

  depends_on = [
     module.net
  ]
}
