# resource "aws_iam_group_membership" "team" {
#   name = "tf-testing-group-membership"
#   users = [
#     aws_iam_user.user1.name,
#     aws_iam_user.user2.name,
#   ]

#   group = aws_iam_group.academy.name
# }


# resource "aws_iam_policy_attachment" "attach" {
#   name       = "test-attachment"
#   users      = [aws_iam_user.user1.name, aws_iam_user.user2.name]
#   policy_arn = aws_iam_policy.policy1.arn
# }

