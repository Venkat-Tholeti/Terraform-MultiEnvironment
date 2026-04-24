variable "project" {
    default = "Testing"
}


variable "common_tags" {
    default = {
        Project = "Test"
        Terraform = "True"
    }
}

variable "sg_name" {
    default = "Test"
}

variable "sg_description" {
    default = "Allowing all ports from all Ip"
}

variable "instances" {
    default = ["mongodb","Redis"]   
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID of JoinDevops"
}

variable "from_port" {
    type = number
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

variable "cidr_block" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "instance_size" {
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }
}