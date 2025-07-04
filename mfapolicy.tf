# ---------------------------------------------
# 1. IAM Policy Document to Enforce MFA
# ---------------------------------------------
# This data block defines an IAM policy that explicitly denies *all* AWS actions
# if the user is NOT authenticated using Multi-Factor Authentication (MFA).
# It uses the aws:MultiFactorAuthPresent condition key.
data "aws_iam_policy_document" "require_mfa" {
  statement {
    sid    = "DenyAllUnlessUsingMFA"
    effect = "Deny"
    actions   = ["*"]
    resources = ["*"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["false"]
    }
  }
}

# ---------------------------------------------
# 2. Create IAM Policy from Document
# ---------------------------------------------
# This resource creates an IAM policy using the JSON document defined above.
# The policy will be available to attach to IAM users, groups, or roles.
resource "aws_iam_policy" "require_mfa" {
  name   = "RequireMFA"
  policy = data.aws_iam_policy_document.require_mfa.json
}

# ---------------------------------------------
# 3. Attach MFA Policy to an IAM Group
# ---------------------------------------------
# This resource attaches the "RequireMFA" policy to the "developers" group.
# Replace the group name with any group you want to secure with MFA enforcement.
resource "aws_iam_group_policy_attachment" "mfa_attachment" {
  group      = "developers"  # Replace with the actual group name
  policy_arn = aws_iam_policy.require_mfa.arn
}
