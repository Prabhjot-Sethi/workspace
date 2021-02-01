#!/bin/bash

sudo kubeadm init --token-ttl 0 --kubernetes-version v1.20.0 --pod-network-cidr 10.32.0.0/12 --service-cidr 10.96.0.0/12

mkdir -p $HOME/.kube
sudo cp -u /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown -R $(id -u):$(id -g) $HOME/.kube
