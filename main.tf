resource "null_resource" "create_directory" {
  provisioner "local-exec" {
    command = "mkdir -p ${var.output_directory}"
  }
}

resource "local_file" "example_file" {
  content  = var.file_content
  filename = "${var.output_directory}/${var.file_name}"
}
