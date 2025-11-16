data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
# This Block Is Optional You Can Use This Block Value For resource_pool_id Or Use Pool Id For resource_pool_id
#data "vsphere_compute_cluster" "cluster" {
#  name          = var.cluster_name
#  datacenter_id = data.vsphere_datacenter.datacenter.id
#}

data "vsphere_resource_pool" "pool" {
  name          = var.pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_network" "network_0" {
  name          = var.network_0
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
# add another interface
data "vsphere_network" "network_1" {
  name          = var.network_1
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_folder" "folder" {
  path = "/${data.vsphere_datacenter.datacenter.name}/vm/${var.vmfolder}"
}


resource "vsphere_virtual_machine" "create-vm" {
  #/* count                  = length(var.node_name) */
  for_each = var.node_name
  #/* name                   = var.node_name[count.index] */
  name = each.key
  # When You Use Pool Id Use This Line
  resource_pool_id = data.vsphere_resource_pool.pool.id
  # When You Use Cluster Id Use This Line
  #  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  num_cpus               = var.cpu
  memory                 = var.memory
  cpu_hot_add_enabled    = var.cpu_hot_add_enabled
  cpu_hot_remove_enabled = var.cpu_hot_remove_enabled
  guest_id               = data.vsphere_virtual_machine.template.guest_id
  scsi_type              = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network_0.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  network_interface {
    network_id   = data.vsphere_network.network_1.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  disk {
    label            = "disk1"
    size             = data.vsphere_virtual_machine.template.disks.1.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.1.thin_provisioned
    unit_number      = 1
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        #/* host_name = var.hostname[count.index] */
        host_name = var.hostname[each.key]
        domain    = var.domain
      }
      network_interface {
        #/* ipv4_address = var.eth_0[count.index] */
        ipv4_address = var.eth_0[each.key]
        ipv4_netmask = var.netmask
      }
      ipv4_gateway    = var.gateway
      dns_server_list = var.dns_server_list[each.key]
      # config for another interface
      network_interface {
        #/* ipv4_address = var.eth_1[count.index] */
        ipv4_address = var.eth_1[each.key]
        ipv4_netmask = var.netmask
      }
    }
  }
}
