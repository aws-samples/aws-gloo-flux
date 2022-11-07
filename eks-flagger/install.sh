#!/bin/bash

<<comment

# Install git
sudo yum update -y
sudo yum install git -y
git version

comment

# Check the version of python , Python3, awscli

whereis python
python --version
python3 --version
pip --version
pip3 --version
aws --version

# if the version of python is 2.x then add the following 3 lines in .bashrc file
echo "alias python='python3'" >> ~/.bashrc
echo "alias pip='pip3'" >> ~/.bashrc
echo "export PATH=~/.local/bin:~/Library/Python/3.7/bin:$PATH" >> ~/.bashrc
chmod a+x ~/.bashrc
# PS1='$ '
. ~/.bashrc

# Install and Upgrade awscli in Python3 environment

echo "Installing awscli in Python3 environment"
pip install --upgrade awscli && hash -r
aws --version
echo "awscli installiton completed"

# Install docker

echo "Installing docker"
sudo yum update -y
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
echo "Docker installed"

# Install jq for JSON parsing in CLI
echo "Installing jq (json query)"
sudo yum install -y jq
echo "jq installed"

# Install yq (yaml query)
echo "Installing yq (yaml query)"
wget https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64.tar.gz -O - | tar xz && sudo mv yq_linux_amd64 /usr/bin/yq
echo "yq installed"

# Install Session Manager Plugin
echo "Installing Session Manager Plugin"
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo yum install -y session-manager-plugin.rpm
echo "Session Manager Plugin installed"


# Install or upgrade eksctl on Linux

echo "Installing eksctl on Linux"
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
echo "eksctl installion completed"

# Install kubectl on Linux

echo "Installing kubectl on Linux"
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version
echo "kubectl installion completed"

# Install Helm

echo "Installing Helm"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version
echo "helm installion completed"

# Install envsubst (from GNU gettext utilities) and bash-completion

sudo yum -y install gettext bash-completion moreutils

# Enable bash_completion:

kubectl completion bash >>  ~/.bash_completion
eksctl completion bash >> ~/.bash_completion
. ~/.bash_completion


# Verify the binaries are in the path and executable

for command in kubectl jq yq envsubst aws eksctl kubectl helm
do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
done
