# script-to-deploy-code-ec2-with-codedeploy
This is a simple script that deploys code to `aws ec2` instance using `aws codedeploy` and stores code as zip in `aws s3`. I assume that you already know what is `aws codedeploy` and how to use it. This script is only for people who don't want to type those long commands to deploy code. 

## How to use ?
1. Download deploy.sh file and open it. 
2. Replace `<project_name>`, `<bucket_name>`, `<codedeploy_app_name>` and `<codedeploy_group_name>`
3. place the `deploy.sh` file along side of `appspec.yml`.
4. run it like this `sh deploy.sh 0.0.1 "My first code deploy" `
5. That's it.  
