#!/bin/bash

echo "creating symlinks..."

DOTFILES="$HOME/git/thibault/dotfiles"

# whitelist new bash
sudo ln -fs "$DOTFILES/bash/shells" /etc/shells

# bash
ln -fs "$DOTFILES/bash/.inputrc" "$HOME/.inputrc"
ln -fs "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
ln -fs "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"

# shellcheck source=bash/.bash_profile
source "$HOME/.bash_profile"

# tmux
ln -fs "$DOTFILES/term/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -fs "$DOTFILES/term/tmux/.tmux_completion" "$HOME/.bash_completion"

# git
ln -fs "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DOTFILES/git/.gitignore" "$HOME/.gitignore"

# emacs
ln -fs "$DOTFILES/emacs/.spacemacs" "$HOME/.spacemacs"

# vim
ln -fs "$DOTFILES/vim/.vimrc.plug" "$HOME/.vimrc.plug"
ln -fs "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"

if [[ $(uname) == "Darwin" ]]; then
    # iterm
    ln -fs "$DOTFILES/term/iterm/com.googlecode.iterm2.plist" \
       "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

    # htop
    ln -fs "$DOTFILES/term/.htoprc" "${HOME}/.config/htop/htoprc"

    # menumeters
    ln -fs "$DOTFILES/term/menumeters/com.ragingmenace.MenuMeters.plist" \
       "$HOME/Library/Preferences/com.ragingmenace.MenuMeters.plist"
elif [[ $(uname) == "Linux" ]]; then
    # spacemacs icon
    ln -fs "$DOTFILES/emacs/spacemacs.desktop" \
       "$HOME/.local/share/applications"

    # rxvt
    ln -fs "$DOTFILES/term/urxvt/.Xresources" "$HOME/.Xresources"
    ln -fs "$DOTFILES/term/urxvt/.urxvt" "$HOME/.urxvt"
    ln -fs "$DOTFILES/term/urxvt/rxvt-unicode.desktop" \
       "$HOME/.local/share/applications"
fi
