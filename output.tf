output "controlplane_ips" {
    value = digitalocean_droplet.k8s_controlplane.ipv4_address
}

output "k8s_nodes_1" {
  value = digitalocean_droplet.k8s_nodes[0].ipv4_address
  description = "1st k8s ipv4 address"
}

output "k8s_nodes_2" {
    value = digitalocean_droplet.k8s_nodes[1].ipv4_address
    description = "2nd k8s ipv4 address"
}

output "ssh_keys" {
    value = data.digitalocean_ssh_keys.mykeys.ssh_keys[*].id
    description = "SSH keys"
}