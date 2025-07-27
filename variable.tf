variable "file_names" {
  description = "List of files to create"
  type        = list(string)
}

variable "output_dirs" {
  description = "List of directories to create"
  type        = list(string)
}

variable "file_content" {
  description = "Content to write into the files"
  type        = string
}

