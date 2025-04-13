# resource "aws_iam_role" "test_role" {
#   name = "test_role_1"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF

#   tags = {
#     provider = "dev"
#   }
# }

# resource "aws_iam_role_policy_attachment" "test-attach" {
#   role       = aws_iam_role.test_role.name
#   policy_arn = aws_iam_policy.policy2.arn
# }

# resource "aws_iam_role_policy_attachment" "test-attach1" {
#   role       = aws_iam_role.test_role.name
#   policy_arn = aws_iam_policy.policy1.arn
# }