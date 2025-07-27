variable "output_dirs" {
  default = ["a", "b"]
}

variable "file_names" {
  default = ["a/filea.txt", "b/fileb.txt"]
}

variable "file_content" {
  default = "Hello from Terraform via Jenkins!"
}

# Create directories a and b
resource "null_resource" "directories" {
  count = length(var.output_dirs)

  provisioner "local-exec" {
    command = terraform.workspace == "windows" ?
      "mkdir ${var.output_dirs[count.index]}" :
      "mkdir -p ${var.output_dirs[count.index]}"
      
    interpreter = terraform.workspace == "windows" ?
      ["cmd", "/C"] : ["/bin/bash", "-c"]
  }
}

# Create files filea.txt and fileb.txt
resource "local_file" "files" {
  count    = length(var.file_names)
  filename = "${path.module}/${var.file_names[count.index]}"
  content  = var.file_content
}
