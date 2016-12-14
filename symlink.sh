echo "creating symlink..."

DOTFILE="${HOME}/github/thibault/dotfiles"

ln -fs ${DOTFILE}/shell/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILE}/shell/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILE}/shell/.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# atom / proton
ln -fs ${DOTFILE}/atom/.proton ${HOME}/.proton
ln -fs ${DOTFILE}/atom/styles.less ${HOME}/.atom/

# vim
ln -fs ${DOTFILE}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILE}/vim/.vimrc ${HOME}/.vimrc

# iterm
ln -fs ${DOTFILE}/iterm/com.googlecode.iterm2.plist \
${HOME}/Library/Preferences/com.googlecode.iterm2.plist

# htop
ln -fs ${DOTFILE}/.htoprc ${HOME}/.config/htop/htoprc
