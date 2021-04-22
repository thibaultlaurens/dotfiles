#!/usr/bin/env bash

echo "running install script.."

# OS related setup
if [[ $(uname) == "Darwin" ]]; then
  # Install xcode cli
  xcode-select --install

  # Install packages
  source "$HOME/.install/brew.sh"

  # Apply os hardening and preferences
  source "$HOME/.install/macos_harden.sh"
  source "$HOME/.install/macos_prefs.sh"

elif [[ $(uname) == "Linux" ]]; then
  # Install packages
  source "$HOME/.install/apt.sh"

  # Install fonts
  git clone --depth 1 https://github.com/ryanoasis/nerd-fonts "$HOME/nerd-fonts"
  "$HOME/nerd-fonts/install.sh" SourceCodePro
  rm -rf "$HOME/nerd-fonts"

  # Enable firewall
  sudo ufw enable
fi

# Install programming languages
source "$HOME/.install/go.sh"
source "$HOME/.install/python.sh"
source "$HOME/.install/node.sh"
source "$HOME/.install/rust.sh"

# Install docker
source "$HOME/.install/docker.sh"

# Install emacs
source "$HOME/.install/emacs.sh"

# Install alacritty
source "$HOME/.install/alacritty.sh"

# Install starship prompt and zsh
curl -fsSL https://starship.rs/install.sh | bash
source "$HOME/.install/zsh.sh"

echo "all done"
