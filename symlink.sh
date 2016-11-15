echo "creating symlink..."

DOTFILE_PATH="$HOME/github/thibault/dotfiles"

#ln -fs $HOME/github/thibault/dotfiles/bash/.bash_profile $HOME/.bash_profile
#source $HOME/.bash_profile

# atom / proton
ln -fs $DOTFILE_PATH/atom/.proton $HOME/.proton

# vim
ln -fs $DOTFILE_PATH/vim/.plug.vim $HOME/.plug.vim
ln -fs $DOTFILE_PATH/vim/.vimrc $HOME/.vimrc

# iterm
ln -fs $DOTFILE_PATH/iterm/com.googlecode.iterm2.plist \
$HOME/Library/Preferences/com.googlecode.iterm2.plist
