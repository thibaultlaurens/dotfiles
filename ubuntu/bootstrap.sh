#!/usr/bin/env bash

echo "seting up ubuntu..."

# Instal apt and snap packages
source install/apt.sh
source install/snap.sh

# Setup emacs, node, docker etc.
source install/spacemacs.sh
source install/node.sh
source install/docker.sh

# Symlink everything
source symlink.sh

echo "all done"
