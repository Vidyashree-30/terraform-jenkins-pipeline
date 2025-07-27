resource "local_file" "file1" {
  filename = "${path.module}/file1.txt"
  content  = "This is file1"
}

resource "local_file" "file2" {
  filename = "${path.module}/file2.txt"
  content  = "This is file2"
}

resource "null_resource" "directory1" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/dir1"
  }
}

resource "null_resource" "directory2" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/dir2"
  }
}
