#!/usr/bin/env bash

sudo apt install docker-ce

systemctl start docker
systemctl enable docker

sudo usermod -aG docker thibault
