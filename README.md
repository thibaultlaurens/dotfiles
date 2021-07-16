# Dotfiles

A bare git repository to store my dotfiles.

## Setup

```sh
# Clone the repo into a bare repository in $HOME
git clone --bare https://github.com/thibaultlaurens/dotfiles $HOME/.dotfiles

# Define a "config" alias in the current shell scope
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the content from the bare repository to $HOME
config checkout

# Hide untracked files to the config alias
config config --local status.showUntrackedFiles no
```

## Usage

Add a new file to the repo:

```sh
config status
config add xxx
config commit -m "Add xxx"
```

Install all the tools:

```sh
sh $HOME/.install/all.sh
```

Lint the `.install` bash scripts:

```sh
shellcheck -e SC1091,SC1090 $HOME/.install/*.sh
```

## Content

```sh
❯ tree -L 2
.
├── .config/
│   ├── alacritty/
│   ├── doom/
│   ├── git/
│   ├── htop/
│   ├── procs/
│   ├── ssh/
│   ├── tmux/
│   ├── vim/
│   └── starship.toml
├── .install/
│   ├── all.sh
│   ├── brew.sh
│   ├── emacs.sh
│   ├── go.sh
│   ├── macos_harden.sh
│   ├── macos_prefs.sh
│   ├── node.sh
│   └── python.sh
├── .gitignore
├── .zshrc
└── README.md
```
