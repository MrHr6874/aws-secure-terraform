# AWS Secure Terraform Project
## Overview
This project sets up AWS security services using Terraform to enhance cloud security. It includes S3 bucket security, AWS Security Hub, GuardDuty, and IAM role configurations to ensure a secure AWS environment.

## Services Used
- **AWS S3**: Secure storage for security logs
- **AWS Security Hub**: Centralized security management
- **AWS GuardDuty**: Threat detection and continuous monitoring
- **AWS IAM**: Role-based access control for auditing

## Prequisites 
#Please ensure you have the following installed on your Ubuntu VM:
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
## Lessons Learned
1. **Infrastructure as Code (IaC) is powerful**: Using Terraform allows for consistent, repeatable deployments.
2. **Security services are essential**: GuardDuty and Security Hub help detect and respond to security threats.
3. **Understanding IAM permissions is crucial**: Misconfigurations in policies can lead to access issues.
4. **Git best practices matter**: Ignoring unnecessary files (`.terraform`) prevents large commits and improves repo efficiency.
5. **Debugging Terraform issues takes time**: Resolving dependency errors and dealing with state conflicts requires patience and troubleshooting skills.
6. **Handling Terraform State Properly**: Managing state files effectively prevents conflicts and ensures accurate deployment tracking.
7. **AWS Permissions Matter**: Some errors were due to insufficient IAM permissions, reinforcing the need for proper role-based access.

## Importance of AWS Security Services
- **AWS GuardDuty** provides threat intelligence to detect suspicious activities.
- **AWS Security Hub** aggregates security alerts from various AWS services, offering a holistic security view.
- **S3 bucket policies** ensure that logs and other sensitive data are securely stored and accessed only by authorized users.
- **IAM roles** enforce least-privilege access, reducing potential attack surfaces.
- **Automation Improves Security Posture**: By automating security services, we ensure a proactive security approach rather than a reactive one.

## Final Thoughts
This project highlighted the importance of automating security configurations using Terraform. By leveraging AWS security services, we can proactively secure cloud infrastructure and respond to potential threats efficiently. Understanding and applying security best practices in Terraform improves overall cloud security resilience.

