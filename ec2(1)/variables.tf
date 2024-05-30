variable "instance_name" {
    type = list(string)
    default = ["db", "frontend", "backend"]
}

variable "img_id" {
    type = string
    default = "ami-090252cbe067a9e58"
}

variable "sg_name" {
    type = string
    default = "allow_ssh"
}

variable "ssh_port" {
    type = number
    default = 22
}