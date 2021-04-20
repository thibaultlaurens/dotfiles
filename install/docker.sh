#!/usr/bin/env/bash

echo "installing docker.."

if [[ $(uname) == "Darwin" ]]; then
    brew cask install docker
    brew install docker-completion

elif [[ $(uname) == "Linux" ]]; then
    # Uninstall old versions
    sudo apt remove \
        docker \
        docker-engine \
        docker.io \
        containerd \
        runc
    
    # Make sure we can setup a repo
    sudo apt update && sudo apt install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Add docker’s official gpg key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Setup docker's repo
    echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the apt package index and install docker engine and containerd
    sudo apt update && sudo apt install \
        docker-ce \
        docker-ce-cli \
        containerd.io
    
    # Create the docker group and add current user
    sudo groupadd docker && sudo usermod -aG docker "$USER"
    newgrp docker 

fi

echo "done"
