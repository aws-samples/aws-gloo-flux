#!/bin/bash

#download podinfo docker images
sudo docker  pull ghcr.io/stefanprodan/podinfo:6.0.0
sudo docker  pull ghcr.io/stefanprodan/podinfo:6.0.1
sudo docker  pull ghcr.io/stefanprodan/podinfo:6.0.2
sudo docker  pull ghcr.io/stefanprodan/podinfo:6.1.0
sudo docker  pull ghcr.io/stefanprodan/podinfo:6.1.5
sudo docker  pull ghcr.io/stefanprodan/podinfo:6.1.6

TAG0=`sudo docker images | grep 'ghcr.io/stefanprodan/podinfo' | grep 6.0.0 | awk '{print $3}'`
TAG1=`sudo docker images | grep 'ghcr.io/stefanprodan/podinfo' | grep 6.0.1 | awk '{print $3}'`
echo "TAG0=" $TAG0
echo "TAG1=" $TAG1
echo "$3=" $3

# : << 'com'
TAG2=`sudo docker images | grep 'ghcr.io/stefanprodan/podinfo' | grep 6.0.2 | awk '{print $3}'`
TAG3=`sudo docker images | grep 'ghcr.io/stefanprodan/podinfo' | grep 6.1.0 | awk '{print $3}'`
TAG4=`sudo docker images | grep 'ghcr.io/stefanprodan/podinfo' | grep 6.1.5 | awk '{print $3}'`
TAG5=`sudo docker images | grep 'ghcr.io/stefanprodan/podinfo' | grep 6.1.6 | awk '{print $3}'`

#create ecr repository
ECR_REPOSITORY=`aws ecr create-repository --repository-name $1 --region $2 --output json | grep repositoryUri |awk -F '"' '{print $4}'`

echo "ECR_REPOSITORY=" $ECR_REPOSITORY

#login to ecr
ECR_ACCOUNT=`echo ${ECR_REPOSITORY} | awk -F '/' '{print $1}'`

echo "ECR_ACCOUNT=" $ECR_ACCOUNT
aws ecr get-login-password --region $2 | sudo docker login --username AWS --password-stdin ${ECR_ACCOUNT}

#tag and push images to ecr
sudo docker tag $TAG0 ${ECR_REPOSITORY}:6.0.0
sudo docker tag $TAG1 ${ECR_REPOSITORY}:6.0.1
sudo docker tag $TAG2 ${ECR_REPOSITORY}:6.0.2
sudo docker tag $TAG3 ${ECR_REPOSITORY}:6.1.0
sudo docker tag $TAG4 ${ECR_REPOSITORY}:6.1.5
sudo docker tag $TAG5 ${ECR_REPOSITORY}:6.1.6

sudo docker push ${ECR_REPOSITORY}:6.0.0 
sudo docker push ${ECR_REPOSITORY}:6.0.1
sudo docker push ${ECR_REPOSITORY}:6.0.2
sudo docker push ${ECR_REPOSITORY}:6.1.0
sudo docker push ${ECR_REPOSITORY}:6.1.5
sudo docker push ${ECR_REPOSITORY}:6.1.6

echo "########################################################################"
echo " Successfully created ECR repository and pushed podinfo images to ECR   "
echo " Please note down the ECR repository URI                                " 
echo " ${ECR_REPOSITORY}                                                      "
echo "########################################################################"
# com
