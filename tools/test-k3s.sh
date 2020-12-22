#!/bin/bash -x
#/etc/systemd/system/k3s.service.env
/sbin/modprobe br_netfilter
/sbin/modprobe overlay
/usr/local/bin/k3s server \                                                                                                                                                                                                 
'--disable-selinux' \
'--no-deploy=traefik' \
'--no-deploy=servicelb' \
'--flannel-backend=none' \
'--disable-network-policy' \
'--https-listen-port=6443' \
'--node-label=kargo-master' \
'--node-name=kargo-master-n01' \
'--cluster-cidr=10.42.0.0/16' \
'--bind-address=10.0.0.3' \
'--node-external-ip=10.0.0.3'
