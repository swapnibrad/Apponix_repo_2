# resource "aws_iam_policy" "policy1" {
#   name        = "iam-policy-1"
#   path        = "/"
#   description = "aws_iam_policy by terraform"

#   policy = jsonencode(
#     {
#       "Version" : "2012-10-17",
#       "Statement" : [
#         {
#           "Sid" : "VisualEditor0",
#           "Effect" : "Allow",
#           "Action" : [
#             "iam:ListUserPolicies",
#             "iam:ListInstanceProfiles",
#             "ec2:GetAssociatedEnclaveCertificateIamRoles",
#             "ec2:CreateLaunchTemplateVersion",
#             "iam:ListPolicyVersions",
#             "iam:ListOpenIDConnectProviders",
#             "ec2:CreateInstanceEventWindow",
#             "iam:ListUsers",
#             "iam:ListMFADeviceTags",
#             "ec2:CreateNetworkAclEntry",
#             "iam:ListUserTags"
#           ],
#           "Resource" : "*"
#         }
#       ]
#   })
# }

# resource "aws_iam_policy" "policy2" {
#   name        = "iam-policy-2"
#   path        = "/"
#   description = "aws_iam_policy by terraform2"

#   policy = jsonencode(
#     {
#       "Version" : "2012-10-17",
#       "Statement" : [
#         {
#           "Sid" : "VisualEditor0",
#           "Effect" : "Allow",
#           "Action" : [
#             "iam:ListUserPolicies",
#             "iam:ListInstanceProfiles",
#             "ec2:GetAssociatedEnclaveCertificateIamRoles",
#             "ec2:*",
#             "iam:ListPolicyVersions",
#             "iam:ListOpenIDConnectProviders",
#             "ec2:CreateInstanceEventWindow",
#             "iam:ListUsers",
#             "iam:ListMFADeviceTags",
#             "ec2:CreateNetworkAclEntry",
#             "iam:ListUserTags"
#           ],
#           "Resource" : "*"
#         }
#       ]
#   })
# }