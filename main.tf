# Loop over each directory and create it using null_resource + local-exec
resource "null_resource" "directories" {
  count = length(var.output_dirs)

  provisioner "local-exec" {
    command = "${terraform.workspace == "windows" ? "mkdir ${var.output_dirs[count.index]}" : "mkdir -p ${var.output_dirs[count.index]}"}"
    interpreter = terraform.workspace == "windows" ? ["cmd", "/C"] : ["/bin/bash", "-c"]
  }
}

# Loop over each file and create it using local_file
resource "local_file" "files" {
  count    = length(var.file_names)
  filename = "${path.module}/${var.file_names[count.index]}"
  content  = var.file_content
}
