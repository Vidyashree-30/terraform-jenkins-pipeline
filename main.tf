# Create directories (cross-platform logic)
resource "null_resource" "directories" {
  count = length(var.output_dirs)

  provisioner "local-exec" {
    command = terraform.workspace == "windows" ? "mkdir ${var.output_dirs[count.index]}" : "mkdir -p ${var.output_dirs[count.index]}"
    interpreter = terraform.workspace == "windows" ? ["cmd", "/C"] : ["/bin/bash", "-c"]
  }
}

# Create files inside the first directory
resource "local_file" "files" {
  count    = length(var.file_names)
  filename = "${path.module}/${var.output_dirs[0]}/${var.file_names[count.index]}"
  content  = var.file_content
  file_permission = "0777"
  directory_permission = "0777"
}
