
This lambda script would enable AWS SecurityHub on member accounts.

The python script source has been gotten from awslabs/aws-securityhub-multiaccount-scripts github repo and it is modified in a way that:
- It runs on AWS **Lambda-Function**
- Fetching member's list info from a **S3 bucket**.

An infrastructure as code using cloudformation has been implemented for deploying it on AWS.
