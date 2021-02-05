
This lambda script would enable AWS SecurityHub on member accounts.

The python script source has been gotten from awslabs/aws-securityhub-multiaccount-scripts github repo and it is modified in a way that:
- It runs on AWS **Lambda-Function**
- Fetching member's list info from a **S3 bucket**.

An infrastructure as code using cloudformation has been implemented for deploying it on AWS under CloudFormation folder:

- SecurityHubMaster.yml and securityhub-enable-members.yml would be run on Master account (The account that is gonna be used as SecurityHub Master account), first template will create securityhub, s3 bucket, IAM role, policies and activate aws-config on the master account, it will also create a lambda function amd cloudwatch event in order to send securityhub-findings to a slack channel automatically. The second script would create a lambda function, S3 buckets, IAM role and policies to activate securityhub and config on member accounts.

 - CloudFormation/MembersRole-Template/cloudformation/securityhub-assume-role-members.yml file would be run on member account in order to giva access to the master account to enable securityhub.

