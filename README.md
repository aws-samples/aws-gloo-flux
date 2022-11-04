### Progressive delivery on Amazon EKS with Flagger and Gloo Edge Ingress Controller

## Prerequisite steps to build the modernized DevOps platform

You need an AWS Account and AWS Identity and Access Management (IAM) user to build the DevOps platform. If you don’t have an AWS account with Administrator access, then create one now by clicking here. You can build this platform in any AWS region however, I will you us-west-1 region throughout this post. You can use a laptop (Mac or Windows) or an Amazon Elastic Compute Cloud (AmazonEC2) instance as a client machine to install all of the necessary software to build the DevOps platform. For this post, I launched an Amazon EC2 instance (with Amazon Linux2 AMI) as the client and install all of the prerequisite software. You need the awscli, git, eksctl, kubectl, and helm applications to build the DevOps platform. Git clone the repo and download all of the prerequisite software in the home directory. If the Amazon EC2 instance doesn’t have git preinstalled, then run this script:

1.	Install git in your Amazon EC2 instance:
sudo yum update -y
sudo yum install git -y
#Check git version
git version

Clone the github repo:
git clone https://github.com/purnasanyal/eks-flagger.git
cd eks-flagger/eks-flagger
ls -lt



TODO: Fill this README out!

Be sure to:

* Change the title in this README
* Edit your repository description on GitHub

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

