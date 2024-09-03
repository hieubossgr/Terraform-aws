resource "aws_iam_role" "gitlab_runner_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        }
        }
    ]
  })
}

resource "aws_iam_policy" "gitlab_runner_policy" {
  name        = var.policy_name
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": [
            "ecr:GetAuthorizationToken",
            "ecr:BatchCheckLayerAvailability",
            "ecr:CompleteLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:InitiateLayerUpload",
            "ecr:PutImage"
        ],
        "Resource": "*"
        },
        {
        "Effect": "Allow",
        "Action": [
            "s3:PutObject",
            "s3:GetObject"
        ],
        "Resource": "arn:aws:s3:::${var.s3_bucket_name}/*"
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.gitlab_runner_role.name
  policy_arn = aws_iam_policy.gitlab_runner_policy.arn
}