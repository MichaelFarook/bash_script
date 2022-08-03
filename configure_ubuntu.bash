#!/bin/bash
#
# This is configuration new Ubuntu after installation on vmware
#

echo
echo "Updating and upgraiding Ubuntu"
echo

sudo apt-get update && sudo apt-get upgrade -y 

echo
echo "Removing programs not used..."
echo

sudo apt-get remove hexchat hexchat-common thunderbird thunderbird-gnome-support thunderbird-locale-en  thunderbird-locale-en-us  banshee tomboy pidgin pidgin-libnotify -y

echo 
echo "Installing programs"
echo 

# Installing some fitures
sudo apt-get install tree
sudo apt-get install htop
sudo apt-get install curl
sudo apt-get install git 
sudo apt-get install oracle-java7-installer

#installing and setting up Vim
sudo apt-get install vim 
wget -O - https://github.com/MichaelFarook/bash_script/blob/main/setup_vim.bash | bash 

# Installing docker 
curl -fsSL https://get.docker.com/ | sh
sudo usermode -a -G docker $USERNAME 

# Installing microk8s
sudo snap install microk8s --classic 
sude usermode -a -G microk8s $USERNAME

# Cleaning
echo 
echo "Cleaning"
echo
sudo apt-get autoclean

# Configuring
echo
echo "Configuring"
echo 
sudo update-alternatives --config java 

# Finish
echo
echo "Finish"
