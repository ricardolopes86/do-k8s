data "digitalocean_image" "image_name" {
  slug = "ubuntu-18-04-x64"
}

data "digitalocean_sizes" "cp_size" {
    filter {
        key = "vcpus"
        values = [2,2]
    }

    filter {
        key = "regions"
        values = ["ams3"]
    }

    sort {
        key = "price_monthly"
        direction = "asc"
    }
}

data "digitalocean_sizes" "size" {
    filter {
        key = "vcpus"
        values = [4,4]
    }

    filter {
        key = "regions"
        values = ["ams3"]
    }

    sort {
        key = "price_monthly"
        direction = "asc"
    }
}

data "digitalocean_ssh_keys" "mykeys" {
    sort {
        key       = "name"
        direction = "asc"
    }
}