# Set up kubernetes lab

## Requirements

- ansible
- vagrant
- virtualbox

## Set up 3 VMs (master, worker1, worker2) and provisions for kubernetes fresh install

Run the following command:
```
ansible-playbook playbook.yml -i inventory
```

## Create a cluster

Connect to the master node
```
vagrant ssh master
```

Then init the cluster:
```
sudo kubeadm init --apiserver-advertise-address=192.168.205.100 --pod-network-cidr=192.168.205.100/24 --upload-certs
```

Follow the instructions:
```
mkdir -p $HOME/.kube                                                                                                              
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config                                                                          
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Install Calico pod network

Run the following commands:
```
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/custom-resources.yaml
```

