# IAM_Project
Project Brief
Client Background:
You are a Cloud Engineer Consultant, working with StartupCo, a fast-growing tech startup that recently launched their first product - a fitness tracking application.
They've been using AWS for three months, initially setting up their infrastructure quickly to meet launch deadlines.
Now that their product is live, they need to address their cloud security fundamentals.  The company has 10 employees who all currently share the AWS root account credentials to access and manage their cloud resources.
This practice started when they were moving quickly to launch, but now their CTO recognizes the security risks this poses.
Current Setup:
* Everyone uses the root account
* No separate permissions for different teams
* No MFA or password policies
* AWS credentials shared via team chat

Current Infrastructure:
* EC2 instances running their application
* S3 buckets storing user data and application assets
* RDS database for user information
* CloudWatch for monitoring
* Several development and production environments
![Blank diagram](https://github.com/user-attachments/assets/ee0715f3-b421-4800-a29a-65c4b5763472)

￼


Team Structure & Access Needs: 
*   4 Developers (need EC2 and S3 access)
*  2 Operations (need full infrastructure access)
*  1 Finance Manager (needs cost management access)
*  3 Data Analysts (need read-only access to data resources)

![Root User](https://github.com/user-attachments/assets/2ede02ac-36fa-46a6-b323-ce79ea7857e5)





Secure Storage of Root Credentials: The root account credentials were securely stored following AWS best practices, accessible only in break-glass scenarios.



￼

5 - Implemented These Permissions
Developers:





EC2 management



S3 access for application files



CloudWatch logs viewing

Operations:





Full EC2, CloudWatch access



Systems Manager access



RDS management

Finance:





Cost Explorer



AWS Budgets



Read-only resource access

Analysts:





Read-only S3 access



Read-only database access
