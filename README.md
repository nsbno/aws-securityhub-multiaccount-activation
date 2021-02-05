
This lambda script would enable AWS SecurityHub on member accounts.

The python script source has been gotten from awslabs/aws-securityhub-multiaccount-scripts github repo and it is modified in a way that:
- It runs on AWS **Lambda-Function**
- The member's list which is in csv format woud be also got from a **S3 bucket**.

An infrastructure as code using both terraform and cloudformation has been implemented for it under the following repo:
https://github.com/nsbno/terraform-aws-securityhub
