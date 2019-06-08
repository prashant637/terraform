resource "vsphere_virtual_machine" "vm-template1" {
  count            = "${var.launch_server_template1["number_of_instace"]}"
  name             = "vm-testing-${count.index}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus                     = "${var.launch_server_template1["number_of_cpu"]}"
  memory                       = "${var.launch_server_template1["memory"]}"
  guest_id                     = "${data.vsphere_virtual_machine.template.guest_id}"
  #guest_id                    = "centos7_64Guest"
  wait_for_guest_net_timeout   = 0
  wait_for_guest_net_routable  = false


  scsi_type                    = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id     = "${data.vsphere_network.network.id}"
    adapter_type   = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
#    name             = "vm-testing-${count.index}"
    size             = "${var.launch_server_template1["disk_size"]}"
    eagerly_scrub    = false
    thin_provisioned = true
  }
}