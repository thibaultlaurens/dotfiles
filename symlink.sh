echo "creating symlinks..."

DOTFILE="${HOME}/git/thibault/dotfiles"

# whitelist new bash
ln -fs ${DOTFILE}/bash/shells /etc/shells

# bash
ln -fs ${DOTFILE}/bash/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILE}/bash/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILE}/bash/.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# tmux
ln -fs ${DOTFILE}/term/tmux/.tmux.conf ${HOME}/.tmux.conf
ln -fs ${DOTFILE}/term/tmux/.tmux_completion ${HOME}/.bash_completion

# git
ln -fs ${DOTFILE}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILE}/git/.gitignore ${HOME}/.gitignore

# emacs
ln -fs ${DOTFILE}/emacs/.spacemacs ${HOME}/.spacemacs

# vim
ln -fs ${DOTFILE}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILE}/vim/.vimrc ${HOME}/.vimrc

if [[ $(uname -s) == Darwin ]]; then
    # iterm
    ln -fs ${DOTFILE}/term/iterm/com.googlecode.iterm2.plist \
       ${HOME}/Library/Preferences/com.googlecode.iterm2.plist

    # htop
    ln -fs ${DOTFILE}/term/.htoprc ${HOME}/.config/htop/htoprc

    # menumeters
    ln -fs ${DOTFILE}/term/menumeters/com.ragingmenace.MenuMeters.plist \
       ${HOME}/Library/Preferences/com.ragingmenace.MenuMeters.plist
else
    # spacemacs icon
    ln -fs ${DOTFILE}/emacs/spacemacs.desktop ${HOME}/.local/share/applications

    # rxvt
    ln -fs ${DOTFILE}/term/urxvt/.Xresources ${HOME}/.Xresources
    ln -fs ${DOTFILE}/term/urxvt/.urxvt ${HOME}/.urxvt
    ln -fs ${DOTFILE}/term/urxvt/rxvt-unicode.desktop ${HOME}/.local/share/applications
fi
