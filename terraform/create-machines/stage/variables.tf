variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}

variable "datacenter" {
  type = string
  default = "<Your-Datacenter-name>"
}

variable "datastore" {
  type = string
  default = "<Your-DataStore-Name>"
}

variable "pool" {
  type = string
  default = "<Your-Poll-Name>"
}
# Network Name
variable "network_0" {
  type = string
  default = "<Your-Network-Inteface-Name-0>"
}
### if you using 2 network interface or more add this lines for each network-interfaces
# Network Name
variable "network_1" {
  type = string
  default = "<Your-Network-Interface-Name-1 >"
}

variable "template" {
  type = string
  default = "<Your-Template-Name>"
}

# IPaddress for network interface 0
variable "eth_0" {
  type = list(string)
  default = [
    "<Your IpAddress>",
    "<Your IpAddress>"
  ]
}
###### IPaddress for network interface 1
variable "eth_1" {
 type = list(string)
 default = [
   "<Your IpAddress>",
   "<Your IpAddress>"
 ]
}
# this name show in vsphere
variable "node_name" {
  type = list(string)
  default = [
    "<Your-Node-Name>",
    "<Your-Node-Name>"
  ]
}

# if you using a uniqe dns server with domain use this option
# variable "domain" {
  # type = string
  # default = "<Your-Domain-Name>"
# }

variable "gateway" {
  type = string
  default = "<Your-Gateway-Ip-Address>"
}

# hostname
variable "hostname" {
  type = list(string)
  default = [
    "<Your-Host-Name-In-Machines>",
    "<Your-Host-Name-In-Machines>"
  ]
}
variable "dns_server_list" {
  type    = list(string)
  default = [
    "<Your-DNS-NameServer>",
    "<Your-DNS-NameServer>"
  ]
}

variable "cpu" {
  type = number
  default = 1
}

variable "memory" {
  type = number
  default = 2048
}

variable "netmask" {
  type = number
  default = 24
}

#  create Virtual-Machines in a selected forder
variable "vmfolder" {
  type = string
  default = "<Your-Folder-Name>"
}

# If using a Cluster in Vsphere use this part
# variable "cluster_name" {
  # type = string
  # default = "< Your Cluster Name >"
# }

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
