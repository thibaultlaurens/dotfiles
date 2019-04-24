echo "creating symlink..."

DOTFILE="${HOME}/git/thibault/dotfiles"

ln -fs ${DOTFILE}/shell/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILE}/shell/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILE}/shell/.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# git
ln -fs ${DOTFILE}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILE}/git/.gitignore ${HOME}/.gitignore

# emacs
ln -fs ${DOTFILE}/emacs/.spacemacs ${HOME}/.spacemacs
ln -fs ${DOTFILE}/emacs/spacemacs.desktop ${HOME}/.local/share/applications

# vim
ln -fs ${DOTFILE}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILE}/vim/.vimrc ${HOME}/.vimrc
