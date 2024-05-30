resource "aws_security_group" "allow_tf" {
  name = var.sg_name
  description = "creating security group to practice terraform"

  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
    CreatedBy = "Rayudu"
  }
}

resource "aws_instance" "expense" {
    count = length(var.instance_name)
    name = var.instance_name[count.index]
    ami = var.img_id
    vpc_security_group_ids = [aws_security_group.allow_tf.id]
    instance_type = var.instance_name[count.index] == "db" ? "t2.small" : "t2.micro"

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_name[count.index]
            Module = var.instance_name[count.index]
        }
    )
}