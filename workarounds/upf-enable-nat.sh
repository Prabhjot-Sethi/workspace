#!/bin/bash

while true
do
    sleep 20
    id=$(sudo docker ps | grep upf | grep "/pause" | awk '{print $1}')
    if [ "$id" == "" ]; then
        continue
    fi
    pid=$(sudo docker inspect -f '{{.State.Pid}}' $id)
    if [ "$pid" == "" ]; then
        continue
    fi
    sudo mkdir -p /var/run/netns
    sudo rm -rf /var/run/netns/temp
    sudo ln -sfT /proc/$pid/ns/net /var/run/netns/temp
    rule=$(sudo ip netns exec temp bash -c 'iptables -S -t nat | grep "\-A POSTROUTING \-o eth0 \-j MASQUERADE"')
    if [ "$rule" == "" ]; then
        sudo ip netns exec temp bash -c 'iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE'
    fi
done
