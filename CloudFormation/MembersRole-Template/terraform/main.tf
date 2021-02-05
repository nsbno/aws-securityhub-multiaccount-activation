data "aws_availability_zones" "main" {}
data "aws_caller_identity" "current-account" {}

locals {
  service_account_id = ""
  current_account_id = data.aws_caller_identity.current-account.account_id
}

##################################
#                                #
# Cross-account roles used by    #
# Logging-Securityhub account    #
#                                #
##################################
resource "aws_iam_role" "cross_account_role_for_activating_securityhub" {
  name               = "ManageSecurityHub"
  assume_role_policy = data.aws_iam_policy_document.cross_account_securityhub_assume.json
}

resource "aws_iam_role_policy" "manage_securityhub" {
  name = "ManageSecurityHub"
  policy = data.aws_iam_policy_document.cross_account_securityhub.json
  role   = aws_iam_role.cross_account_role_for_activating_securityhub.id
}