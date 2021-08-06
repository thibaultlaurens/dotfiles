#!/usr/bin/env/bash

# Create the gpg directory
mkdir "$HOME"/.gnupg

# Update gpg-agent conf with pinent-mac path
echo 'pinentry-program /usr/local/bin/pinentry-mac' >"$HOME"/.gnupg/gpg-agent.conf

# Tell gpg to use the gpg-agent
echo 'use-agent' >"$HOME"/.gnupg/gpg.conf

# Update gnupg folder permission
chmod 700 "$HOME"/.gnupg

# Reload terminal
source "$HOME"/.zshrc

# Reload gpg config
gpgconf --reload

# Create a GPG key
gpg --full-gen-key

# Get the short fingerprint
gpg -K --keyid-format SHORT

echo 'update git config from the text after ed25519/'
echo 'get the public key with: gpg --armor --export XXXX'
