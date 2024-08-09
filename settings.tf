variable "prefix" {
  type    = string
  default = "terratask"
}

variable "vm-count" {
  type    = number
  default = 3
}

# in order to follow the task we iterate names not via count.index
locals {
  nic-names = [
    for i in range(var.vm-count) : "nic-${i + 1}"
  ]
}

locals {
  description = "dynamic list of Network Security Rules"
  /*
    name                   = string
    priority               = 100 - 4097
    direction              = Inbound / Outbound
    access                 = Allow / Deny
    protocol               = Tcp, Udp, Icmp, Esp, Ah or *
    source_port_range      = 0 - 65535 or *
    destination_port_range = 0 - 65535 or *
  */
  security-rules = [
    {
      name                   = "Allow-HTTP"
      priority               = 101
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    },
    {
      name                   = "Allow-HTTPS"
      priority               = 102
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "443"
    }
  ]
}

variable "vm_user" {
  description = "Admin username"
  type        = string
  default     = "testadmin"
}

variable "vm_pass" {
  description = "Admin password"
  type        = string
  default     = "Password1234!"
}
