#!/bin/bash
#
# This is script for configuring git 
#

echo ""
echo "Configuring Git..."
echo "Enter your git username: "
read USER
echo "Write you git email " 
read EMAIL

echo "Configuring global user name and email"
git config --global user.name "$USER" 
git config --global user.email "$EMAIL"

# Creating the ssh key 
git config --global credential.helper "cache --timeout=3600"

read -r -p "Do you wand to ssh credentials for Git? [y/n]" ANSW

# If the answer is in uppercase, I use the next line to change it to lowerCase 
ANSW=${ANSW,,} 

if [[ $ANSW =~ ^(yes|y)$ ]]
then 
	echo "Configuration ssh"
	ssh-keygen -t ed25519 -C "$EMAIL"
	echo "This is you public key. To activate it in github, go github settings and enter following key:"
	cat ~/.ssh/id_ed25519.pub 
fi 

echo ""
echo "ssh key created and your username and email configured"

