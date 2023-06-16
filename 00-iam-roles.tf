resource "aws_iam_role" "codedeploy_role" {
  name = var.codedeploy_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.codedeploy_role_name
  }
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_1" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  role = aws_iam_role.codedeploy_role.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_2" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role = aws_iam_role.codedeploy_role.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = aws_iam_role.codedeploy_role.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_4" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  role = aws_iam_role.codedeploy_role.name
}


resource "aws_iam_role" "codepipeline_role" {
  name = var.codepipeline_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.codepipeline_role_name
  }
}


resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_6" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = aws_iam_role.codepipeline_role.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_7" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  role = aws_iam_role.codepipeline_role.name
}




resource "aws_iam_role" "codebuild_role" {
  name = var.codebuild_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.codebuild_role_name
  }
}


resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_8" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = aws_iam_role.codebuild_role.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_10" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  role = aws_iam_role.codebuild_role.name
}