#!/bin/bash

# taint master to allow scheduling in single node
kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl apply -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
wget https://docs.projectcalico.org/manifests/custom-resources.yaml
sed -i -e 's/192.168.0.0\/16/10.32.0.0\/12/g' custom-resources.yaml

kubectl apply -f custom-resources.yaml
rm -rf custom-resources.yaml


