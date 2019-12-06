# Dotfiles

## Layout

```
.
├── emacs/                                # spacemacs config and icon
├── git/                                  # git config and global gitignore
├── osx/                                  # mac os preferences, installers and apps configs
├── shell/                                # bash config (prompt, aliases, functions, exports etc.)
├── tmux/                                 # tmux config and auto completion
├── ubuntu/                               # ubuntu preferences, installers and apps configs
├── vim/                                  # vim config and plugins
├── .gitignore
└── README.md
```

## OSX setup

```
mkdir git/thibault
cd git/thibault
git clone https://github.com/thibaultlaurens/dotfiles.git
cd dotfiles/osx
. ./bootstrap.sh
```

## Ubuntu setup

```
sudo apt install git
mkdir git/thibault
cd git/thibault
git clone https://github.com/thibaultlaurens/dotfiles.git
cd dotfiles/ubuntu
. ./bootstrap.sh
```
