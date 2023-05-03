Terraform Automation for AWS

This repository contains the code for automating the creation and configuration of an EC2 instance with chef automate server on Amazon Web Services (AWS) using Terraform.

Prerequisites
Before you can use this code, you need to have the following:

An AWS account
AWS CLI installed and configured on your local machine
Terraform installed on your local machine
Usage
To use this code, follow these steps:

Clone this repository to your local machine:

bash
Copy code
git clone https://github.com/manjunath111/Chefworkspace.git
Navigate to the terraform-automateserver-aws directory:


cd Chefworkspace/terraform-automateserver-aws

Initialize Terraform:

terraform init


Create a plan:

terraform plan


Apply the plan:

terraform apply

Configuration
You can configure the EC2 instance by modifying the variables.tf file. This file contains the following variables:

aws_access_key: The AWS access key.
aws_secret_key: The AWS secret key.
aws_region: The AWS region.
instance_type: The instance type.
ami_id: The Amazon Machine Image (AMI) ID.
key_name: The name of the key pair to use for SSH access.
public_ip: Whether to assign a public IP address to the instance.
subnet_id: The ID of the subnet to launch the instance in.
Contributing
If you would like to contribute to this project, please fork this repository and submit a pull request.


Credits
This project was created by Manjunath Reddy.
