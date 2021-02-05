### ManageSecuirtHub ###
data "aws_iam_policy_document" "cross_account_securityhub_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.securityhub_master}:root"]
    }
  }
}
data "aws_iam_policy_document" "cross_account_securityhub" {
  statement {
    actions = ["iam:CreateServiceLinkedRole"]
    effect  = "Allow"
    resources = [
      "*",
    ]
    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["securityhub.amazonaws.com","config.amazonaws.com"]
    }
  }
  statement {
    actions = ["securityhub:*"]
    effect  = "Allow"
    resources = [
      "*",
    ]
  }
  statement {
    actions = [
      "config:DescribeConfigurationRecorders",
      "config:DescribeDeliveryChannels",
      "config:DescribeConfigurationRecorderStatus",
      "config:DeleteConfigurationRecorder",
      "config:DeleteDeliveryChannel",
      "config:PutConfigurationRecorder",
      "config:PutDeliveryChannel",
      "config:StartConfigurationRecorder",
      ]
    effect  = "Allow"
    resources = [
      "*",
    ]
  }
  statement {
    actions = ["iam:PassRole"]
    effect  = "Allow"
    resources = [
      "arn:aws:iam::*:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig",
    ]
  }
  statement {
    actions = [
      "s3:CreateBucket",
      "s3:PutBucketPolicy",
      "s3:ListBucket",
      ]
    effect  = "Allow"
    resources = [
      "arn:aws:s3:::config-bucket-*",
    ]
  }
}