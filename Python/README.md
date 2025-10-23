A tiny Flask app that shows a read-only dashboard of your AWS account:
- **EC2 instances** (running only)
- **VPCs**
- **ALB/NLB (elbv2) load balancers**
- **AMIs you own**

It uses the **default AWS credential chain** (env vars, `~/.aws/credentials`, SSO/profile, or IAM role).  
If no credentials are detected, the app serves a **friendly setup page** with step-by-step instructions.

---

## ✨ Features
- Autodetects AWS credentials and region (falls back to `us-east-2`)
- Handles pagination for EC2 and ELBv2
- Clear HTML tables, no front-end framework required
- Graceful error messages for AWS API failures

---

## 🧱 Requirements
- Python 3.9+
- An AWS identity with read permissions for:
  - `sts:GetCallerIdentity`
  - `ec2:DescribeInstances`, `ec2:DescribeVpcs`, `ec2:DescribeImages`
  - `elasticloadbalancing:DescribeLoadBalancers`

---

## 🚀 Quick Start

```bash
# 1) Clone your repo
git clone https://github.com/arielsilberman/jbrollingproject.git
cd jbrollingproject

# 2) (Recommended) Use a virtual environment
python -m venv .venv
# Windows PowerShell
. .venv/Scripts/Activate.ps1
# macOS/Linux
# source .venv/bin/activate

# 3) Install dependencies
pip install -r requirements.txt  # make sure requirements.txt includes: Flask boto3 botocore

# 4) Run
python app.py
# or explicitly set port/debug:
# PORT=5001 FLASK_DEBUG=true python app.py
