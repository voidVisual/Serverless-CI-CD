# Serverless-CI-CD-Pipeline-with-AWS-Lambda-GitHub-Actions
Serverless CI/CD Pipeline with AWS Lambda &amp; GitHub Actions A fully automated CI/CD pipeline deploying an AWS Lambda function using GitHub Actions and Terraform. It provisions AWS infrastructure, deploys serverless functions, and integrates CloudWatch for monitoring.  

## Overview
This repository demonstrates a **Serverless CI/CD pipeline** using **AWS Lambda, GitHub Actions, and Terraform**. The pipeline automates the deployment of a **Python-based AWS Lambda function** triggered on every push to the `main` branch.

## Architecture
```
[ GitHub Actions ] ---> [ AWS Lambda Deployment ] ---> [ CloudWatch Monitoring ]
        |                        |
        v                        v
 [ Terraform (Infra) ]      [ API Gateway (Optional) ]
```

## Tech Stack
- **Cloud:** AWS (Lambda, IAM, CloudWatch)
- **CI/CD:** GitHub Actions
- **Infrastructure as Code:** Terraform
- **Languages:** Python (for Lambda), Bash, YAML

---

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/yourusername/serverless-cicd-aws.git
cd serverless-cicd-aws
```

### Configure AWS Credentials
Ensure your AWS CLI is configured correctly:
```bash
aws configure
```

### Deploy Infrastructure using Terraform
Navigate to the `terraform` directory and apply Terraform configuration:
```bash
cd terraform
terraform init
terraform apply -auto-approve
```
This will create an **IAM role** and deploy an **AWS Lambda function**.

### Deploy Lambda Function Manually (If Needed)
If you want to deploy the Lambda function manually, navigate to the `lambda` directory and run:
```bash
cd lambda
zip function.zip lambda_function.py
aws lambda create-function --function-name my-serverless-app \
  --runtime python3.8 --role <IAM_ROLE_ARN> \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip
```

### Set Up GitHub Actions for CI/CD
- Add AWS credentials as **secrets** in your GitHub repository (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`).
- The GitHub Actions workflow file is located in `.github/workflows/github_actions_ci_cd.yml`.
- On every push to `main`, the **GitHub Actions pipeline** will automatically deploy the Lambda function.

### Monitor Logs in AWS CloudWatch
```bash
aws logs tail /aws/lambda/my-serverless-app --follow
```

---

## 📂 Project Structure
```
📂 serverless-cicd-aws
 ├── 📂 terraform (Infrastructure as Code - AWS Lambda, IAM Role)
 ├── 📂 lambda (AWS Lambda Function)
 │   ├── lambda_function.py (Python Function Code)
 ├── 📂 .github/workflows (GitHub Actions CI/CD Pipeline)
 │   ├── github_actions_ci_cd.yml
 ├── README.md (Project Documentation)
```

---

## Future Enhancements
- Add **API Gateway** to expose Lambda as a REST API.
- Implement **unit testing** in GitHub Actions.
- Enable **AWS X-Ray** for distributed tracing.

