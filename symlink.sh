#!/bin/bash

echo "creating symlinks..."

: "${HOME:=~}"
: "${GIT_REPOS:=$HOME/git/thibault}"
: "${DOTFILES:=$GIT_REPOS/dotfiles}"

# bash
ln -fs "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
ln -fs "$DOTFILES/bash/.inputrc" "$HOME/.inputrc"
ln -fs "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"

# whitelist new bash
sudo ln -fs "$DOTFILES/bash/shells" "/etc/shells"

# tmux
ln -fs "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# git
ln -fs "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DOTFILES/git/.gitignore" "$HOME/.gitignore"

# emacs
ln -fs "$DOTFILES/emacs/.spacemacs" "$HOME/.spacemacs"

# vim
ln -fs "$DOTFILES/vim/.vimrc.plug" "$HOME/.vimrc.plug"
ln -fs "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"

# htop
ln -fs "$DOTFILES/htop/htoprc" "${HOME}/.config/htop/htoprc"

if [[ $(uname) == "Darwin" ]]; then
    # iterm
    ln -fs "$DOTFILES/osx/iterm/com.googlecode.iterm2.plist" \
       "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

    # menumeters
    ln -fs "$DOTFILES/osx/menumeters/com.ragingmenace.MenuMeters.plist" \
       "$HOME/Library/Preferences/com.ragingmenace.MenuMeters.plist"
elif [[ $(uname) == "Linux" ]]; then
    # rxvt
    ln -fs "$DOTFILES/ubuntu/urxvt/.Xresources" "$HOME/.Xresources"
    ln -fs "$DOTFILES/ubuntu/urxvt/.urxvt" "$HOME/.urxvt"

    # spacemacs and rxvt icons
    ln -fs "$DOTFILES/emacs/spacemacs.desktop" \
       "$HOME/.local/share/applications/spacemacs.desktop"
    ln -fs "$DOTFILES/ubuntu/urxvt/rxvt-unicode.desktop" \
       "$HOME/.local/share/applications/rxvt-unicode.desktop"
fi
