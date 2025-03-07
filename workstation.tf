module "workstation" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.security_group]
  # convert StringList to list and get first element
  ami = data.aws_ami.ami_info.id
  user_data = file("work.sh")
  tags = {
        Name = "workstation"
    }
}