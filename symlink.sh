#!/bin/bash

echo "creating symlinks.."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Bash
ln -fs "$DIR/bash/.bash_profile" "$HOME/.bash_profile"
ln -fs "$DIR/bash/.inputrc" "$HOME/.inputrc"
ln -fs "$DIR/bash/.bashrc" "$HOME/.bashrc"

# Whitelist newly installed bash
sudo ln -fs "$DIR/bash/shells" "/etc/shells"

# Tmux
ln -fs "$DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Git
ln -fs "$DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DIR/git/.gitignore" "$HOME/.gitignore"

# Emacs
ln -fs "$DIR/emacs/.spacemacs" "$HOME/.spacemacs"

# Vim
ln -fs "$DIR/vim/.vimrc.plug" "$HOME/.vimrc.plug"
ln -fs "$DIR/vim/.vimrc" "$HOME/.vimrc"

# Htop
ln -fs "$DIR/htop/htoprc" "${HOME}/.config/htop/htoprc"

if [[ $(uname) == "Darwin" ]]; then
    # Iterm
    ln -fs "$DIR/osx/iterm/com.googlecode.iterm2.plist" \
       "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

    # Menumeters
    ln -fs "$DIR/osx/menumeters/com.ragingmenace.MenuMeters.plist" \
       "$HOME/Library/Preferences/com.ragingmenace.MenuMeters.plist"

elif [[ $(uname) == "Linux" ]]; then
    # Rxvt
    ln -fs "$DIR/ubuntu/urxvt/.Xresources" "$HOME/.Xresources"
    ln -fs "$DIR/ubuntu/urxvt/.urxvt" "$HOME/.urxvt"

    # Spacemacs and rxvt icons
    ln -fs "$DIR/emacs/spacemacs.desktop" \
       "$HOME/.local/share/applications/spacemacs.desktop"
    ln -fs "$DIR/ubuntu/urxvt/rxvt-unicode.desktop" \
       "$HOME/.local/share/applications/rxvt-unicode.desktop"
fi
echo "done"
