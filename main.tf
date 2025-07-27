terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

variable "output_dirs" {
  type    = list(string)
  default = ["a", "b"]
}

resource "null_resource" "create_dirs_linux" {
  count = terraform.workspace == "linux" ? 1 : 0

  provisioner "local-exec" {
    command = "mkdir -p ${var.output_dirs[0]} ${var.output_dirs[1]}"
  }
}

resource "null_resource" "create_dirs_windows" {
  count = terraform.workspace == "windows" ? 1 : 0

  provisioner "local-exec" {
    command = "mkdir ${var.output_dirs[0]} && mkdir ${var.output_dirs[1]}"
  }
}

resource "local_file" "filea" {
  count    = terraform.workspace == "linux" || terraform.workspace == "windows" ? 1 : 0
  filename = "${var.output_dirs[0]}/filea.txt"
  content  = "File A created by Terraform!"
}

resource "local_file" "fileb" {
  count    = terraform.workspace == "linux" || terraform.workspace == "windows" ? 1 : 0
  filename = "${var.output_dirs[1]}/fileb.txt"
  content  = "File B created by Terraform!"
}
