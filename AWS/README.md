
This directory contains **infrastructure notes** and **AWS CLI commands** related to the Flask + Boto3 demo.

---

## 🌍 Region
All examples assume:
us-east-2

bash
Copy code

---

## 🔒 Minimal IAM Policy

Attach this policy to the IAM user/role that runs the Flask app:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    { "Effect": "Allow", "Action": ["ec2:Describe*"], "Resource": "*" },
    { "Effect": "Allow", "Action": ["elasticloadbalancing:Describe*"], "Resource": "*" },
    { "Effect": "Allow", "Action": ["sts:GetCallerIdentity"], "Resource": "*" }
  ]
}
🖥 Useful CLI Commands
bash
Copy code
# Identity check
aws sts get-caller-identity

# EC2
aws ec2 describe-instances --region us-east-2
aws ec2 describe-vpcs --region us-east-2

# Load Balancers
aws elbv2 describe-load-balancers --region us-east-2

# AMIs owned by me
aws ec2 describe-images --owners self --region us-east-2
🏗 Example Terraform Task
 Launch an EC2 t3.medium in a public subnet

 Security group:

Inbound: TCP 22 (SSH), 5001 (Flask)

Outbound: all traffic

 Assign public IP

 Use key pair for SSH access

(Keep state files safe. Never commit real secrets.)

🔑 Credentials in Bash
bash
Copy code
export AWS_ACCESS_KEY_ID="yourAccessKey"
export AWS_SECRET_ACCESS_KEY="yourSecretKey"
export AWS_DEFAULT_REGION="us-east-2"

# Only if temporary creds are provided:
export AWS_SESSION_TOKEN="yourSessionToken"
⚠️ Safety
❌ Do not commit real credentials

✅ Clean up labs after use:

Terminate EC2 instances

Delete Load Balancers

Release Elastic IPs

yaml
Copy code
