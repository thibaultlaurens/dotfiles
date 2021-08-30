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
  aspell
  bandwhich
  bat
  coreutils
  ctop
  curl
  docker-completion
  dust
  exa
  fd
  ffmpeg
  findutils
  fzf
  gawk
  git
  gnu-indent
  gnu-sed
  gnu-tar
  gnupg
  gpg2
  gping
  graphviz
  grep
  gzip
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
  rg
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
  appcleaner
  balenaetcher
  bitwarden
  docker
  firefox
  font-fira-code-nerd-font
  google-backup-and-sync
  handshaker
  keepassxc
  little-snitch
  micro-snitch
  protonmail-bridge
  protonvpn
  spectacle
  standard-notes
  stats
  tor-browser
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
