#!/usr/bin/env/bash

echo "installing docker.."

if [[ $(uname) == "Darwin" ]]; then
    brew cask install docker
    brew install docker-completion

elif [[ $(uname) == "Linux" ]]; then
    sudo apt remove docker docker.io containerd runc
    sudo apt update && sudo apt install docker.io
    sudo systemctl enable --now docker
    sudo usermod -aG docker tlaurens
fi

echo "done"
