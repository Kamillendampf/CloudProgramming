# Prerequisites
Before deploying the infrastructure, ensure that the following prerequisites are met:

    Terraform is installed on your local machine.
        You can download and install Terraform from the (official website)[https://developer.hashicorp.com/terraform/install?product_intent=terraform].

    AWS CLI is installed and configured with valid credentials.
        You can install the AWS CLI by following the instructions here.
        Run ``` aws configure ``` to set up your credentials and default region.

    AWS IAM Permissions: Ensure that your AWS user has permissions to create the required resources (S3, IAM, etc.). This should include permissions for s3:PutBucketPolicy, s3:CreateBucket, and others depending on the resources in the configuration.
    
  # 1. Initialize Terraform 
  (only needed if you haven't the terraform files)

Before applying any Terraform changes, you need to initialize the working directory. This will download the required provider plugins (e.g., AWS).

``` terraform init ```
# 2. Proof File Path of ressources
You may need to change the file paths of the resources in the S3 Buckets (File: s3Frontend.tf, s3Backend.tf). By default the paths are set on "C:/CloudProgramming/Webseite/..." (this are example resources). 
In case you need a diffferent path you need to change them.

# 3 Plan the Infrastructure

Before applying the changes, you can run terraform plan to preview the infrastructure changes. This will show you what resources will be created, updated, or deleted without making any actual changes.
``` terraform plan ```

# 4 Apply the Infrastructure

To create the resources defined in the Terraform configuration, run the following command:

``` terraform apply ```
# 5 Destroy the Infrastructure

If you want to delete the resources created by Terraform, you can use the terraform destroy command. This will remove all resources managed by Terraform.

``` terraform destroy ```
