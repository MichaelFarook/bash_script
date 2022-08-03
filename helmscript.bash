#!/bin/bash 
#
# This is script for my helm and kubernetes 

sudo microk8s config >/tmp/kubeconfig
export KUBECONFIG=/tmp/kubeconfig
sudo chmod go-r /tmp/ kubeconfig 
