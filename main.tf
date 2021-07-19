//test change 2

module "startup-script-lib" {
  source = "git::https://github.com/terraform-google-modules/terraform-google-startup-scripts.git?ref=v0.1.0"
}

provider "google" {
    project = var.project
    zone = var.zone
}

resource "google_compute_instance" "puppet-master" {

  name = "puppet"

  machine_type = "e2-medium"

  boot_disk {
      initialize_params {
          image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20210211"
      }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    startup-script        = "${module.startup-script-lib.content}"
    startup-script-custom = file("${path.module}/masterstartup.sh")
  }
}

resource "google_compute_instance" "puppet-slave" {

  name = "puppet-slave"

  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20210211"
    }
  }

  network_interface {
    network = "default"
    access_config {} 
  }
  
  metadata = {
    startup-script        = "${module.startup-script-lib.content}"
    startup-script-custom = file("${path.module}/slavestartup.sh")
  }
}
