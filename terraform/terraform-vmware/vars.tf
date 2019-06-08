variable "vsphere_user" {
	default = ""
}

variable "vsphere_password" {
	default = ""
}
variable "vsphere_server" {
	default = ""
}

# Comment this line out if you use datastore clusters

variable "datacenter_name" {
	default = ""
}

# Comment this line out if you use datastore clusters

variable "datastore_name" {
	default = ""
}

# Comment this line out if you use network_name

variable "network_name" {
	default = "public"
}

variable "template_name" {
	default = "template1"
}

variable "resource_pool_name"{
	default = ""
}

variable "launch_server_template1"{
	type = "map"
	default = {
		"number_of_instace" = "5"
        "number_of_cpu"     = "2"
        "memory"            = "2048"
        "disk_size"         = "50"
    }
}

variable "launch_server_template2"{
	type = "map"
	default = {
		"number_of_instace" = "3"
        "number_of_cpu"     = "4"
        "memory"            = "4096"
        "disk_size"         = "100"
    }
}