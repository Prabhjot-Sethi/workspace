#!/bin/bash

KUBE_VERSION=${KUBE_VERSION:-1.20.1}

sudo kubeadm init --token-ttl 0 --kubernetes-version v${KUBE_VERSION} --pod-network-cidr 10.32.0.0/12 --service-cidr 10.96.0.0/12

mkdir -p $HOME/.kube
sudo cp -u /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown -R $(id -u):$(id -g) $HOME/.kube
