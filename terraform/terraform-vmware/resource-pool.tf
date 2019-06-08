data "vsphere_resource_pool" "pool" {
    name          = "{var.network_name}"
    datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}