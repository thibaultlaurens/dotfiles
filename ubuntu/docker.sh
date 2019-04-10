#!/usr/bin/env bash

sudo -v

# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up docker stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install the latest version of Docker CE and containerd
sudo apt-get install docker-ce docker-ce-cli containerd.io
