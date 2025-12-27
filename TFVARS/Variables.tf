variable "project" {
  default = "roboshop"
}

variable "environment" {
}

variable "instance_type" {
}

variable "ami_id" {
  description = "AMI ID OF JOINDEVOPS"
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "sg_name" {
  default = "Terraform"
}


variable "sg_description" {
  default = "ALLOW ALL PORTS"
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "common_tags" {
  default = {
    Project   = "roboshop"
    Terraform = "true"
  }
}

variable "instances" {
  default = ["mongodb", "redis"]
}
