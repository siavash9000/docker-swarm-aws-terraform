resource "aws_security_group" "vote" {
  name        = "${var.vpc_key}-sg-dockerswarm"
  description = "Security group for docker swarm"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
      from_port   = 5000
      to_port     = 5001
      protocol    = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"
      ]
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [
        "0.0.0.0/0"
      ]
  }

  tags {
    Name = "${var.vpc_key}-sg-dockerswarm"
    VPC = "${var.vpc_key}"
    Terraform = "Terraform"
  }
}
