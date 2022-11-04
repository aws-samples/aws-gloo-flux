### Progressive delivery on Amazon EKS with Flagger and Gloo Edge Ingress Controller

## Prerequisite steps to build the modernized DevOps platform

You need an AWS Account and AWS Identity and Access Management (IAM) user to build the DevOps platform. If you don’t have an AWS account with Administrator access, then create one now by clicking here. You can build this platform in any AWS region however, I will you us-west-1 region throughout this post. You can use a laptop (Mac or Windows) or an Amazon Elastic Compute Cloud (AmazonEC2) instance as a client machine to install all of the necessary software to build the DevOps platform. For this post, I launched an Amazon EC2 instance (with Amazon Linux2 AMI) as the client and install all of the prerequisite software. You need the awscli, git, eksctl, kubectl, and helm applications to build the DevOps platform. Git clone the repo and download all of the prerequisite software in the home directory. If the Amazon EC2 instance doesn’t have git preinstalled, then run this script:

1.	Install git in your Amazon EC2 instance:
```
sudo yum update -y
sudo yum install git -y
#Check git version
git version
```

Clone the github repo:
```
git clone https://github.com/purnasanyal/eks-flagger.git
cd eks-flagger/eks-flagger
ls -lt
```
2.	Download all of the prerequisite software from install.sh which includes awscli, eksctl, kubectl, helm, and docker:

```
. install.sh 
```
Check the version of the software installed:
```
aws --version
eksctl version
kubectl version -o json 
helm version
docker --version
docker info
```
If the docker info shows an error like “permission denied”, then reboot the Amazon EC2 instance or re-log in to the instance again:

3.	Use “aws configure” to setup the config and credentials file:
```
AWS Access Key ID [None]: xxxxxxxxxxxxxxxxxxxxxx
AWS Secret Access Key [None]: xxxxxxxxxxxxxxxxxx
Default region name [None]: us-west-1
Default output format [None]:
```
View and verify your current IAM profile:
```
aws sts get-caller-identity
```
4.	Create an Amazon Elastic Container Repository (Amazon ECR) and push application images.

Amazon ECR is a fully-managed container registry that makes it easy for developers to share and deploy container images and artifacts. ecr setup.sh script will create a new Amazon ECR repository and also push the podinfo images (6.0.0, 6.0.1, 6.0.2, 6.1.0, 6.1.5 and 6.1.6) to the Amazon ECR. Run ecr-setup.sh script with the parameter ECR repository name (e.g. ps-flagger-repository) and region (e.g. us-west-1) 
```
./ecr-setup.sh <ps-flagger-repository> <us-west-1>
```
You’ll see output like the following (truncated).
```
###########################################################
Successfully created ECR repository and pushed podinfo images to ECR #
Please note down the ECR repository URI           
xxxxxx.dkr.ecr.us-west-1.amazonaws.com/ps-flagger-repository                                                    
```
Note the Uniform Resource Identifier (URI) - URI - xxxxxxx.dkr.ecr.us-west-1.amazonaws.com/ps-flagger-repository.







TODO: Fill this README out!

Be sure to:

* Change the title in this README
* Edit your repository description on GitHub

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

