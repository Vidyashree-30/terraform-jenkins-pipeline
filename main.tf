variable "output_dirs" {
  default = ["a", "b"]
}

variable "file_names" {
  default = ["a/filea.txt", "b/fileb.txt"]
}

variable "file_content" {
  default = "Hello from Terraform via Jenkins!"
}

# For Linux (mkdir -p)
resource "null_resource" "linux_directories" {
  count = terraform.workspace == "linux" ? length(var.output_dirs) : 0

  provisioner "local-exec" {
    command = "mkdir -p ${var.output_dirs[count.index]}"
  }
}

# For Windows (mkdir)
resource "null_resource" "windows_directories" {
  count = terraform.workspace == "windows" ? length(var.output_dirs) : 0

  provisioner "local-exec" {
    command     = "mkdir ${var.output_dirs[count.index]}"
    interpreter = ["cmd", "/C"]
  }
}

# Create files inside folders
resource "local_file" "files" {
  count    = length(var.file_names)
  filename = "${path.module}/${var.file_names[count.index]}"
  content  = var.file_content
}
