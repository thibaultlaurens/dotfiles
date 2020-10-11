#!/usr/bin/env bash

echo "setting up environment.."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# OS related setup first
if [[ $(uname) == "Darwin" ]]; then
    source "$DIR/osx/setup.sh"
elif [[ $(uname) == "Linux" ]]; then
    source "$DIR/ubuntu/setup.sh"
fi

# Install programming languages
source "$DIR/lang/go.sh"
source "$DIR/lang/node.sh"
source "$DIR/lang/python.sh"
source "$DIR/lang/rust.sh"

# Install docker
source "$DIR/docker/docker.sh"

# Install emacs
source "$DIR/emacs/emacs.sh"

# Link bash config
ln -fs "$DIR/bash/.bash_profile" "$HOME/.bash_profile"
ln -fs "$DIR/bash/.inputrc" "$HOME/.inputrc"
ln -fs "$DIR/bash/.bashrc" "$HOME/.bashrc"

# Link tmux config
ln -fs "$DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Link git config
ln -fs "$DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DIR/git/.gitignore" "$HOME/.gitignore"

# Link vim config
ln -fs "$DIR/vim/.vimrc.plug" "$HOME/.vimrc.plug"
ln -fs "$DIR/vim/.vimrc" "$HOME/.vimrc"

# Link htop config
ln -fs "$DIR/htop/htoprc" "${HOME}/.config/htop/htoprc"

# Reload bashrc
source "$HOME/.bashrc"

echo "don't forget to copy the default ssh config"
# cp "$DIR/ssh/config" "${HOME}/.ssh/config"

echo "all done"
