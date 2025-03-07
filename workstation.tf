module "work_station_ec2"{

source  = "terraform-aws-modules/ec2-instance/aws"
ami = data.aws_ami.ami_info.id
vpc_security_group_ids = [aws_security_group.sg.id]
instance_type= "t3.micro"
user_data = file ("workstation.tf")
tags = {
    name ="workstation"
}

}

resource "aws_security_group" "sg" {
 
 description  = "allow_ssh"

 ingress {
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks=["0.0.0.0/0"]

}
    egress {
    to_port = 0
    from_port = 0
    protocol = "tcp"
    cidr_blocks=["0.0.0.0/0"]
    
}
    tags  = {
        name = "allow_tls"
        createdby = "vijaysai"
    }
}