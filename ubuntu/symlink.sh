echo "creating symlink..."

DOTFILE="${HOME}/git/thibault/dotfiles"

# rxvt
ln -fs ${DOTFILE}/ubuntu/urxvt/.Xresources ${HOME}/.Xresources
ln -fs ${DOTFILE}/ubuntu/urxvt/.urxvt ${HOME}/.urxvt
ln -fs ${DOTFILE}/ubuntu/urxvt/rxvt-unicode.desktop ${HOME}/.local/share/applications

# tmux
ln -fs ${DOTFILE}/ubuntu/.tmux.conf ${HOME}/.tmux.conf

# bash
ln -fs ${DOTFILE}/shell/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILE}/shell/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILE}/shell/.bash_profile ${HOME}/.bash_profile
ln -fs ${DOTFILE}/shell/.bash_completion ${HOME}/.bash_completion
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
