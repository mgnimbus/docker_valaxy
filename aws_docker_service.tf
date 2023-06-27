resource "random_pet" "docker_server" {
  length = 1

  # If you want force the random_id to create a new on if we change a particular attribute
  keepers = {
    key_name = var.key_name
  }

}

resource "aws_instance" "docker_server" {
  ami           = "ami-05e411cf591b5c9f6" # data.aws_ami.server_ami.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("${path.module}/user_data.sh")

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    Name = var.add_tag ? join("-", [var.docker_server_name, random_pet.docker_server.id]) : var.docker_server_name
  }
}
