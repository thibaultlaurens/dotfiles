#!/usr/bin/env bash

echo "installing node and npm..."
sudo apt install node
sudo apt install npm

# install npm specific tools
sudo npm install -g tern
sudo npm install -g diff-so-fancy
