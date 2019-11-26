echo "creating symlink..."

DOTFILE="${HOME}/git/tlaurens/dotfiles"

ln -fs ${DOTFILE}/shell/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILE}/shell/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILE}/shell/.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# git
ln -fs ${DOTFILE}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILE}/git/.gitignore ${HOME}/.gitignore

# emacs
ln -fs ${DOTFILE}/emacs/.spacemacs ${HOME}/.spacemacs

# vim
ln -fs ${DOTFILE}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILE}/vim/.vimrc ${HOME}/.vimrc

# iterm
ln -fs ${DOTFILE}/osx/iterm/com.googlecode.iterm2.plist \
${HOME}/Library/Preferences/com.googlecode.iterm2.plist

# htop
ln -fs ${DOTFILE}/osx/.htoprc ${HOME}/.config/htop/htoprc

# menumeters
ln -fs ${DOTFILE}/osx/menumeters/com.ragingmenace.MenuMeters.plist \
   ${HOME}/Library/Preferences/com.ragingmenace.MenuMeters.plist
