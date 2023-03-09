#!/bin/sh

sudo kubeadm init --apiserver-advertise-address=192.168.205.100 --pod-network-cidr=192.168.205.100/24 --upload-certs
mkdir -p $HOME/.kube                                                                                                              
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config                                                                          
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/custom-resources.yaml

