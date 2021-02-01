#!/bin/bash

set -ex

SCRIPT_DIR=$(dirname $0)
sed -i -e "s/__NODE_IP__/$1/g" $SCRIPT_DIR/tf-manifest.yaml
kubectl apply -f $SCRIPT_DIR/tf-manifest.yaml

MASTER=$(kubectl get nodes | grep master | awk '{print $1}')
kubectl label node $MASTER node-role.opencontrail.org/config=
kubectl label node $MASTER node-role.opencontrail.org/configdb=
kubectl label node $MASTER node-role.opencontrail.org/control=
kubectl label node $MASTER node-role.opencontrail.org/agent=
kubectl label node $MASTER node-role.opencontrail.org/analytics=
kubectl label node $MASTER node-role.opencontrail.org/analytics_alarm=
kubectl label node $MASTER node-role.opencontrail.org/analytics_snmp=
kubectl label node $MASTER node-role.opencontrail.org/analyticsdb=
kubectl label node $MASTER node-role.opencontrail.org/webui=

