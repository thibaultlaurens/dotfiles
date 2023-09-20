#!/usr/bin/env/bash

# Install homebrew if it's missing
if test ! "$(which brew)"; then
  echo "Installing brew:"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R "$(whoami)" "$(brew --prefix)"/*

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

echo "Upgrading packages:"
brew update && brew upgrade

# Add more sources
brew tap Homebrew/bundle
brew tap homebrew/cask-fonts

packages=(
  ag
  alfred
  aspell
  bandwhich
  bash
  bat
  cmake
  coreutils
  ctop
  curl
  docker-completion
  dust
  eza
  fd
  ffmpeg
  findutils
  fx
  fzf
  gawk
  git
  gnu-indent
  gnu-sed
  gnu-tar
  gnupg
  gping
  graphviz
  grep
  grip
  gzip
  hadolint
  htop
  httpie
  hugo
  jq
  kubectl
  less
  lnav
  make
  markdown
  monit
  moreutils
  nmap
  openssh
  openssl
  pinentry-mac
  procs
  rar
  ripgrep
  ruby
  shellcheck
  tealdeer
  tig
  tmux
  tree
  vim
  watch
  wget
  zsh
)

echo "Installing packages:"
brew install "${packages[@]}"

apps=(
  adapter
  adobe-creative-cloud
  alacritty
  balenaetcher
  bitwarden
  docker
  firefox
  font-fira-code-nerd-font
  google-drive
  karabiner-elements
  little-snitch
  macpass
  micro-snitch
  protonmail-bridge
  protonvpn
  rectangle
  standard-notes
  starship
  stats
  transmission
  virtualbox
  vlc
  zoom
)

echo "Installing apps:"
brew install --cask "${apps[@]}"

ql_packages=(
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlvideo
  quicklook-csv
  quicklook-json
  suspicious-package
)

echo "Installing quick look packages:"
brew install "${ql_packages[@]}"

echo "Cleaning up and checking for problems:"
brew cleanup -s && brew doctor

echo "Done."
