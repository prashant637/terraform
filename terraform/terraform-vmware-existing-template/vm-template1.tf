resource "vsphere_virtual_machine" "vm-template1" {
  count            = "${var.launch_configuration_1["number_of_instace"]}"
  name             = "vm-template1-testing-${count.index+1}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus                     = "${var.launch_configuration_1["number_of_cpu"]}"
  memory                       = "${var.launch_configuration_1["memory"]}"
  guest_id                     = "${data.vsphere_virtual_machine.template.guest_id}"
  wait_for_guest_net_timeout   = 0
  wait_for_guest_net_routable  = false


  scsi_type                    = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id     = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "disk0"
  #  name            = "vm-testing-${count.index}.vmdk"
    size             = "${var.launch_configuration_1["disk_size"]}"
    eagerly_scrub    = false
    thin_provisioned = false
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "terraform-tests"
        domain    = "test.internal"
      }

#      network_interface {
#        ipv4_address = "10.0.0.10"
#        ipv4_netmask = 24
#      }

      ipv4_gateway = "10.0.0.1"
    }
  }
  user_data = "${file("install_docker.sh")}"
} 
