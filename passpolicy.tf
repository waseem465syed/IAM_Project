# This resource sets a global password policy for all IAM users in the AWS account
resource "aws_iam_account_password_policy" "secure_password_policy" {

  # Minimum password length required (best practice: 12–14+ characters)
  minimum_password_length = 11

  # Require at least one special character (!@#$%^&*)
  require_symbols = true

  # Require at least one numeric character (0-9)
  require_numbers = true

  # Require at least one uppercase letter (A-Z)
  require_uppercase_characters = true

  # Require at least one lowercase letter (a-z)
  require_lowercase_characters = true

  # Allow users to change their password through AWS Console or CLI
  allow_users_to_change_password = true

  # Whether the password expires automatically and must be rotated (false = soft expiration)
  hard_expiry = false

  # Force users to rotate passwords every 90 days
  max_password_age = 90

  # Prevent users from reusing any of their last 5 passwords
  password_reuse_prevention = 5
}
