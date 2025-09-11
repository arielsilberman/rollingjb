# Jhon Bryce Rolling Project

This repository contains exercises and mini-projects from the **John Bryce DevOps course**, including both Python scripts and an AWS resource dashboard built with Flask + boto3.  

---

## 📂 Project Structure
Jhon_Bryce_Rolling_Project/
├── AWS/
│ ├── app.py # Flask app that lists AWS resources
│ ├── README.md # AWS-specific instructions
│ └── instance_running.jpg
├── Python/
│ ├── Rolling.py # Python rolling project script
│ └── README.md # Python-specific instructions
└── README.md # This file (overall project overview)

markdown
Copy code

---

## 🚀 Features

### Python
- Example scripts for course labs (e.g., `Rolling.py`).
- Practice with functions, modules, error handling, and automation.

### AWS (Flask + boto3)
- A Flask app that shows:
  - **EC2 instances** (running only)
  - **VPCs**
  - **Load Balancers** (via ELBv2)
  - **AMIs you own**
- If no credentials are detected, the app shows a **setup page** with PowerShell instructions.

---

## 🧱 Requirements
- Python 3.9+
- Virtualenv recommended
- AWS credentials with read-only permissions for:
  - `sts:GetCallerIdentity`
  - `ec2:Describe*`
  - `elasticloadbalancing:DescribeLoadBalancers`

Install dependencies:

```bash
pip install -r requirements.txt
▶️ Running the Projects
Python scripts
From the Python/ folder:

bash
Copy code
python Rolling.py
AWS Flask app
From the AWS/ folder:

bash
Copy code
python app.py
Open your browser at http://localhost:5001.

🔐 Setting AWS Credentials
The AWS app uses the standard boto3 credential chain. Options:

Environment variables (temporary for current shell):

powershell
Copy code
$env:AWS_ACCESS_KEY_ID="AKIA..."
$env:AWS_SECRET_ACCESS_KEY="..."
$env:AWS_DEFAULT_REGION="us-east-2"
Permanent env vars (Windows, persists):

powershell
Copy code
[System.Environment]::SetEnvironmentVariable("AWS_ACCESS_KEY_ID","AKIA...","User")
[System.Environment]::SetEnvironmentVariable("AWS_SECRET_ACCESS_KEY","...","User")
[System.Environment]::SetEnvironmentVariable("AWS_DEFAULT_REGION","us-east-2","User")
AWS config files:

shell
Copy code
%UserProfile%\.aws\credentials
%UserProfile%\.aws\config
IAM role: Works automatically when deployed to EC2/ECS with an instance role.

⚙️ Environment Variables
Name	Default	Description
AWS_REGION	—	Preferred region
AWS_DEFAULT_REGION	us-east-2	Region fallback
PORT	5001	Flask port
FLASK_DEBUG	false	Debug mode

🧭 Workflow
Clone the repo:

bash
Copy code
git clone https://github.com/arielsilberman/rollingjb.git
cd rollingjb
Create a virtual environment.

Install requirements.

Run Python scripts or launch the AWS Flask dashboard.

Push changes to GitHub:

bash
Copy code
git add .
git commit -m "Message"
git push origin main
