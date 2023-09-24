# Configure the Hetzner Cloud Provider
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
