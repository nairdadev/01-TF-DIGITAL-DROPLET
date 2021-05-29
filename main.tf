#Provider - Digital Ocean
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.9.0"
    }
  }
}

#Variable si no se tiene Variable de entorno
variable token_do {
type = string
description = "Token de Digital Ocean"
}

#Pass provider
#export TF_VAR_token_do=""
provider "digitalocean" {
  token = var.token_do
}

#Droplet
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "NOMBREDROPLET"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}