
resource "aws_instance" "Test" {
   count = length(var.instances) 
   ami = var.ami_id
   instance_type = var.instance_size
   vpc_security_group_ids = [ aws_security_group.Test.id ]
   
   tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.instances[count.index]}-${var.environment}"
    }
   ) 

}

resource "aws_security_group" "Test" {
      name = "${var.project}-${var.sg_name}-${var.environment}"
      description = var.sg_description

      ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        ipv6_cidr_blocks = ["::/0"]
      }
      
      egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        ipv6_cidr_blocks = ["::/0"]
      }

      tags = merge(
        var.common_tags,
        {
          Name = "${var.project}-${var.sg_name}-${var.environment}"
        }
      )
}