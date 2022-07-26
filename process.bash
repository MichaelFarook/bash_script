#!/bin/bash
#
# This part is for Helm configuration 
sudo microk8s config >/tmp/kubeconfig
export KUBECONFIG=/tmp/kubeconfig

kubectl config view --raw > ~/.kube/config # This line you need to insert
before you run helm 

sudo chmod go-r /tmp/kubeconfig
# This part is for color of Vim depends of the time of the day
# 
# Assign the filename
filename=".vimrc"
# Create variable to check the Time 
TIME=$(date "+%H")
HOUR=16
# Creating variables to change colorsheme in vim 
morning="darkblue"
evening="pablo"

# Here I check the time 
if [ $TIME -lt $HOUR ]; then
        cd ~
        sed -i "s/$evening/$morning/" $filename
else        
        cd ~ 
        sed -i "s/$morning/$evening/" $filename
fi
                                                        
