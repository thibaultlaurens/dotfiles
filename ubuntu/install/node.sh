#!/usr/bin/env bash

echo "installing node and npm..."
sudo apt install node
sudo apt install npm

# install npm specific tools
sudo npm install -g tern # used by terminal buffers in emacs
sudo npm install -g diff-so-fancy # used by git config
sudo npm install -g vmd # used by markdown preview in emacs
sudo npm install -g eslint # on-the-fly syntax checking in emacs
sudo npm install -g prettier # automatic code formatting in emacs
