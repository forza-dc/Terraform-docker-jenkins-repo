resource "aws_iam_role" "rds_role" {
  name = "rds_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service":  "rds.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "new_role"
  }
}

###--------iam-policy-creations----
resource "aws_iam_policy" "rds_policy" {
  name        = "rds_policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
#------policy-attachment-----
resource "aws_iam_policy_attachment" "new-attach" {
  name       = "new-attachment"
  roles      = [aws_iam_role.rds_role.name]
  policy_arn = aws_iam_policy.rds_policy.arn
}