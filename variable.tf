variable "file_names" {
  description = "List of file names"
  type        = list(string)
  default     = ["file1.txt", "file2.txt"]
}

variable "file_content" {
  description = "Content for files"
  type        = string
  default     = "Hello from Terraform via Jenkins!"
}

variable "output_dirs" {
  description = "Directories to create"
  type        = list(string)
  default     = ["dir1", "dir2"]
}
