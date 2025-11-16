variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}

variable "datacenter" {
  type    = string
  default = "< Your Datacenter Name >"
}

variable "datastore" {
  type    = string
  default = "< Your Datastore name >"
}

variable "pool" {
  type    = string
  default = "< Your Pool Name >"
}
# Network Name
variable "network_0" {
  type    = string
  default = "< Your Network-0 Name >"
}
# Network Name
variable "network_1" {
  type    = string
  default = "< Your Network-1 Name >"
}

variable "template" {
  type    = string
  default = "< Your Template Name >"
}

###### IPaddress for network interface 0
/* variable "eth_0" {
  type = list(string)
  default = [
    "<Your IpAddress>",
    "<Your IpAddress>"
  ]
} */

variable "eth_0" {
  type = map(string)
  default = {
    "key"                 = "value",
    "< Your IpAddress >"  = "<Name>",
    "< Your IpAddress2 >" = "<Name>"
  }
}

###### IPaddress for network interface 1
# variable "eth_1" {
#   type = list(string)
#   default = [
#     "<Your IpAddress>",
#     "<Your IpAddress>"
#   ]
# }

variable "eth_1" {
  type = map(string)
  default = {
    "key"                 = "value",
    "< Your IpAddress >"  = "<Name>",
    "< Your IpAddress2 >" = "<Name>"
  }
}

# this name show in vsphere
/* variable "node_name" {
  type = list(string)
  default = [
    "<Your node_name>",
    "<Your node_name>"
  ]
} */

variable "node_name" {
  type = map(string)
  default = {
    "key"                = "value",
    "< Your NodeName >"  = "<Name>",
    "< Your NodeName2 >" = "<Name>"
  }
}

variable "domain" {
  type    = string
  default = "< Your Domain Address Like 'dc.test.prod' >"
}

variable "gateway" {
  type    = string
  default = "< Your Gateway Ip Address >"
}

# hostname
/* variable "hostname" {
  type = list(string)
  default = [
    "<Your Hostname>",
    "<Your Hostname>"
  ]
} */

variable "hostname" {
  type = map(string)
  default = {
    "key"                = "value",
    "< Your HostName >"  = "<Name>",
    "< Your HostName2 >" = "<Name>"
  }
}

/* variable "dns_server_list" {
  type    = list(string)
  default = ["<Your DNS IpAddresses>"]
} */

variable "dns_server_list" {
  type = map(string)
  default = {
    "key"           = "value",
    "< Your DNS >"  = "<Name>",
    "< Your DNS2 >" = "<Name>"
  }
}

variable "cpu" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 2048
}

variable "netmask" {
  type    = number
  default = 24
}

variable "vmfolder" {
  type    = string
  default = "< Your Folder Name >"
}

variable "cluster_name" {
  type    = string
  default = "< Your Cluster Name >"
}

variable "cpu_hot_add_enabled" {
  type    = bool
  default = true
}
variable "cpu_hot_remove_enabled" {
  type    = bool
  default = true
}
variable "memory_hot_add_enabled" {
  type    = bool
  default = true
}
