terraform {
    required_providers {
        digitalocean =  {
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "k8s_controlplane" {
    image = data.digitalocean_image.image_name.id
    name = "controlplane"
    region = "ams3"
    size = element(data.digitalocean_sizes.cp_size.sizes, 0).slug
    ssh_keys = [ data.digitalocean_ssh_key.mykey.id ]

    provisioner "local-exec" {    
        command = "echo '[controlplane]' > ./k8s-setup/inventory; echo '${self.ipv4_address}' >> ./k8s-setup/inventory; echo '[nodes]' >> ./k8s-setup/inventory;"
    }
}

resource "digitalocean_droplet" "k8s_nodes" {
    count = 2
    image = data.digitalocean_image.image_name.id
    name = "node-${count.index}"
    region = "ams3"
    size = element(data.digitalocean_sizes.size.sizes, 0).slug
    ssh_keys = [ data.digitalocean_ssh_key.mykey.id ]

    provisioner "local-exec" {    
        command = "echo '${self.ipv4_address}' >> ./k8s-setup/inventory"  
    }
}