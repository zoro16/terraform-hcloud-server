variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true # Requires terraform >= 0.14
}

variable "server_type_map" {
  description = "This is a mapping for Hcloud's server types. The `key` is a combination of `[Processor Architecture]_[Number of vCores]_[RAM size]`. The `value` is Hcloud server type name."
  type        = map(string)
  default = {
    "x86_1_2GB" : "cx11",  # Intel
    "x86_2_4GB" : "cx21",  # Intel
    "x86_2_8GB" : "cx31",  # Intel
    "x86_4_16GB" : "cx41", # Intel
    "x86_8_32GB" : "cx51", # Intel

    "x86_2_2GB" : "cpx11",   # AMD
    "x86_3_4GB" : "cpx21",   # AMD
    "x86_4_8GB" : "cpx31",   # AMD
    "x86_8_16GB" : "cpx41",  # AMD
    "x86_16_32GB" : "cpx51", # AMD

    "x86_2_8GB_dedicated" : "ccx13",    # Dedicated AMD
    "x86_4_16GB_dedicated" : "ccx23",   # Dedicated AMD
    "x86_8_32GB_dedicated" : "ccx33",   # Dedicated AMD
    "x86_16_64GB_dedicated" : "ccx43",  # Dedicated AMD
    "x86_32_128GB_dedicated" : "ccx53", # Dedicated AMD
    "x86_48_192GB_dedicated" : "ccx63", # Dedicated AMD

    "arm64_2_4GB" : "cax11",   # ARM64
    "arm64_4_8GB" : "cax21",   # ARM64
    "arm64_8_16GB" : "cax31",  # ARM64
    "arm64_16_32GB" : "cax41", # ARM64
  }
}
