#!/bin/bash

KUBE_VERSION=${KUBE_VERSION:-1.20.1}

sudo apt-get update -y
sudo apt-get install -y linux-headers-$(uname -r) docker.io
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubelet=${KUBE_VERSION}-00 kubeadm=${KUBE_VERSION}-00 kubectl=${KUBE_VERSION}-00

# setup nodes based on thier roles
#sudo kubeadm init
