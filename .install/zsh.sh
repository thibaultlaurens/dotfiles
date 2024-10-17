#!/usr/bin/env bash

# Install zsh
brew install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
config restore "$HOME/.zshrc"

# Clone zsh plugins
: "${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM"/plugins/zsh-history-substring-search
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "$ZSH_CUSTOM"/plugins/autoupdate
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM"/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM"/plugins/zsh-syntax-highlighting

# Reload zshrc
source "$HOME/.zshrc"
