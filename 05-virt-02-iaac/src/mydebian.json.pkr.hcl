
source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "b1gbprt1137p9ib1uet2"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e9b572rr81uv7uljfobe"
  token               = "y0_AgAAAAAL6pDhAATuwQAAAAEJ98bJAADYiKjhw3dGOK3Cu83mrzjee6sMbw"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
        "sudo apt-get update",
        "sudo apt-get install ca-certificates curl",
        "sudo install -m 0755 -d /etc/apt/keyrings",
        "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc",
        "sudo chmod a+r /etc/apt/keyrings/docker.asc",
        "echo 'hello from packer'"
    ]
  }
}
