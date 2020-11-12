#!/usr/bin/env bash

echo "setting up environment.."
DF_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# OS related setup first
if [[ $(uname) == "Darwin" ]]; then
    source "$DF_DIR/osx/setup.sh"
elif [[ $(uname) == "Linux" ]]; then
    source "$DF_DIR/ubuntu/setup.sh"
fi

# Install programming languages
source "$DF_DIR/lang/go.sh"
source "$DF_DIR/lang/python.sh"
source "$DF_DIR/lang/node.sh"
source "$DF_DIR/lang/rust.sh"

# Install docker
source "$DF_DIR/docker/docker.sh"

# Install emacs
source "$DF_DIR/emacs/emacs.sh"

# Link bash config
ln -fs "$DF_DIR/bash/.bash_profile" "$HOME/.bash_profile"
ln -fs "$DF_DIR/bash/.inputrc" "$HOME/.inputrc"
ln -fs "$DF_DIR/bash/.bashrc" "$HOME/.bashrc"

# Link tmux config
ln -fs "$DF_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Link git config
ln -fs "$DF_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DF_DIR/git/.gitignore" "$HOME/.gitignore"

# Link vim config
ln -fs "$DF_DIR/vim/.vimrc.plug" "$HOME/.vimrc.plug"
ln -fs "$DF_DIR/vim/.vimrc" "$HOME/.vimrc"

# Link .config files
ln -fs "$DF_DIR/config/htop/htoprc" "${HOME}/.config/htop/htoprc"
ln -fs "$DF_DIR/config/procs/config.toml" "${HOME}/.config/procs/config.toml"

# Reload bashrc
source "$HOME/.bashrc"

echo "don't forget to copy the default ssh config"
# cp "$DF_DIR/ssh/config" "${HOME}/.ssh/config"

echo "all done"
