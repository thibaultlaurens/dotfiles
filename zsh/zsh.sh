#!/usr/bin/env bash

echo "installing zsh.."
DF_ZSH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ $(uname) == "Darwin" ]]; then
    brew install zsh
elif [[ $(uname) == "Linux" ]]; then
    sudo apt update && sudo apt install zsh
fi

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# install zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-autosuggestions \
    "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# install zsh-completions
git clone https://github.com/zsh-users/zsh-completions \
    "${ZSH_CUSTOM:=-~/.oh-my-zsh/custom}/plugins/zsh-completions"

# # Link zsh config
ln -fs "$DF_ZSH_DIR/.zshrc" "$HOME/.zshrc"

# echo "installing oh-my-zsh.."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



