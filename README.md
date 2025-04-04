# Terraform AWS Security Setup
# AWS Secure Terraform Project

## Overview
This project sets up an AWS security infrastructure using Terraform. It provisions security services like Security Hub, GuardDuty, IAM roles, and an S3 bucket for security logs.

## Prerequisites
Before starting, ensure you have the following installed on your Ubuntu VM:
- Git
- AWS CLI
- Terraform

### Install Git
```bash
sudo apt update && sudo apt install -y git
```

### Install AWS CLI
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### Install Terraform
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform -y
```

## AWS Setup
1. **Create an IAM user** with programmatic access and attach necessary policies.
2. **Configure AWS CLI** by running:
```bash
aws configure
```
Provide your Access Key, Secret Key, Region, and Output format.

## Cloning the Repository
```bash
git clone https://github.com/MrHr6874/aws-secure-terraform.git
cd aws-secure-terraform
```

## Initializing Terraform
```bash
terraform init
```

## Planning and Applying Terraform
```bash
terraform plan
terraform apply -auto-approve
```

### Common Errors and Fixes
- **ACL Deprecated Warning**: AWS deprecated ACLs; modify S3 bucket resources accordingly.
- **S3 Bucket Already Exists**: Ensure the bucket name is unique.
- **Permission Denied for Bucket Policy**: Update IAM policies to allow `s3:PutBucketPolicy`.
- **GuardDuty Detector Already Exists**: Remove duplicate detector configurations or import existing ones.

## Verifying the Deployment
### Check S3 Bucket Policy
```bash
aws s3api get-bucket-policy --bucket my-security-logs-532839197548
```

### List GuardDuty Detectors
```bash
aws guardduty list-detectors
```

## Updating README.md on GitHub
After updating the `README.md` file, use the following commands to commit and push the changes:
```bash
git add README.md
git commit -m "Updated README documentation"
git push origin main
```

## Cleanup
To destroy all resources:
```bash
terraform destroy -auto-approve
```

## Conclusion
This project demonstrates how to use Terraform for setting up AWS security services. It covers installation, configuration, troubleshooting, and validation of security resources.

