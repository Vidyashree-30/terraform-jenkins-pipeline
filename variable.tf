variable "file_name" {
  type        = string
  description = "Name of the file to create"
}

variable "file_content" {
  type        = string
  description = "Content to write into the file"
}

variable "output_directory" {
  type        = string
  description = "Directory to store the file"
}
