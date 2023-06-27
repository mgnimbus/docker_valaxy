resource "aws_iam_role" "ec2_role" {
  name = "ec2_role_${random_pet.docker_server.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "Ec2InstanceProfile"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonElasticFileSystemsUtils",
    # aws_iam_policy.policy.arn
  ]
}


resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_profile_${random_pet.docker_server.id}"
  role = aws_iam_role.ec2_role.name
}
