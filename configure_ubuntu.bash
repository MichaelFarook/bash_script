#!/bin/bash
#################################################################
# Post-installation configuration for new Ubuntu VM on VMware
#################################################################

set -e  # Exit on error

# Function for updating and upgrading the system
update_and_upgrade() {
    echo -e "\nUpdating and upgrading Ubuntu...\n"
    sudo apt-get update && sudo apt-get upgrade -y
}

# Function for removing unused programs
remove_unused_programs() {
    echo -e "\nRemoving unused programs...\n"
    sudo apt-get remove -y hexchat hexchat-common thunderbird thunderbird-gnome-support \
        thunderbird-locale-en thunderbird-locale-en-us banshee tomboy pidgin pidgin-libnotify
}

# Function for installing useful programs
install_programs() {
    echo -e "\nInstalling programs...\n"
    sudo apt-get install -y tree htop curl git tmux usermode nvim vim
    wget -qO- https://github.com/MichaelFarook/bash_script/blob/main/setup_vim.bash | bash 
}

# Function for installing Docker
install_docker() {
    echo -e "\nInstalling Docker...\n"
    curl -fsSL https://get.docker.com/ | sh
    sudo usermod -aG docker $USER
}

# Function for installing Kubernetes tools
install_k8s_tools() {
    echo -e "\nInstalling Kubernetes tools (MicroK8s, Helm)...\n"
    sudo snap install microk8s --classic
    sudo usermod -aG microk8s $USER
    sudo snap install helm --classic
}

# Function for installing Terraform and Terragrunt
install_terraform_tools() {
    echo -e "\nInstalling Terraform and Terragrunt...\n"
    sudo snap install terraform
    sudo snap install terragrunt
}

# Function for cleaning up the system
clean_up() {
    echo -e "\nCleaning up...\n"
    sudo apt-get autoclean
}

# Function for additional configurations
additional_config() {
    echo -e "\nConfiguring alternatives...\n"
    sudo update-alternatives --config java
}

# Function to install tmux and fetch tmux configuration
install_tmux_and_setup() {
    echo -e "\nInstalling tmux and setting up tmux configuration...\n"
    sudo apt-get install -y tmux
    wget -qO- https://github.com/MichaelFarook/bash_script/blob/main/setup_tmux_config.bash | bash
}

# Function to add the aliaces in .bashrc 
configure_aliaces(){
    echo -e "\nConfiguring the aliaces in ~/.bashrc"
    cat <<EOL >> ~/.bashrc

# My Aliases
alias v='nvim'
alias ..='cd ..'

# Kubectl Aliases
alias k='kubectl'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgall='kubectl get all'
alias kdp='kubectl describe pod'
alias kgs='kubectl get service'
alias kgd='kubectl get deployments'
alias ks='kubectl config set-context --current --namespace'
EOL
    # Reload .bashrc to apply changes
    source ~/.bashrc
}

# Main script execution
update_and_upgrade
remove_unused_programs
install_programs
install_docker
install_k8s_tools
install_terraform_tools
install_tmux_and_setup
configure_aliaces
clean_up
additional_config

echo -e "\nAll tasks completed successfully!\n"
