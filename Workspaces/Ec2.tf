
resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = lookup(var.instance_type, terraform.workspace)
  #instance_type = terraform.workspace == "prod" ? "t3.big" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.Devops.id]

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}.${var.instances[count.index]}-${terraform.workspace}"
      Component   = var.instances[count.index]
      Environment = terraform.workspace
    }
  )
}

resource "aws_security_group" "Devops" {
  name        = "${var.sg_name}-${terraform.workspace}"
  description = var.sg_description


  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}.${var.sg_name}-${terraform.workspace}"
    }
  )
}

#COMMANDS
#TO CREATE NEW WORKSPACE - terraform workspace new dev or prod or whatever #NEW EMPTY STATE FILE WILL BE CREATED
#TO CHANGE WORK SPACE - terraform workspace select prod
#TO SHOW CURRENT WORKSPACE - terraform workspace show
#TO LIST ALL WORKSPACES - terraform workspace list
#TO DELETE WORKSPACE - terraform workspace delete prod #CANNOT DELETE CURRENT WORKSPACE
