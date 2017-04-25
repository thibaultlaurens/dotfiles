echo "creating symlink..."

DOTFILE="${HOME}/github/thibault/dotfiles"

ln -fs ${DOTFILE}/shell/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILE}/shell/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILE}/shell/.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# emacs
ln -fs ${DOTFILE}/.spacemacs ${HOME}/.spacemacs

# vim
ln -fs ${DOTFILE}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILE}/vim/.vimrc ${HOME}/.vimrc

# iterm
ln -fs ${DOTFILE}/iterm/com.googlecode.iterm2.plist \
${HOME}/Library/Preferences/com.googlecode.iterm2.plist

# htop
ln -fs ${DOTFILE}/.htoprc ${HOME}/.config/htop/htoprc
