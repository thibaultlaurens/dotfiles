#!/usr/bin/env/bash

# Install homebrew if it's missing
if test ! "$(which brew)"; then
  echo "\e[34mInstalling brew:\e[0m"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R "$(whoami)" "$(brew --prefix)"/*

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

echo "\e[34mUpgrading packages:\e[0m"
brew update && brew upgrade

# Add more sources
brew tap Homebrew/bundle

packages=(
  ag
  aspell
  bat
  bandwhich
  coreutils
  ctop
  curl
  dust
  exa
  fd
  ffmpeg
  kubectl
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
  less
  lnav
  make
  markdown
  monit
  moreutils
  nmap
  openssh
  openssl
  procs
  pinentry-mac
  tealdeer
  rg
  shellcheck
  tig
  tmux
  tree
  vim
  watch
  wget
)

echo "\e[34mInstalling packages:\e[0m"
brew install "${packages[@]}"

apps=(
  adapter
  adobe-creative-cloud
  appcleaner
  balenaetcher
  bitwarden
  firefox
  font-sauce-code-pro-nerd-font
  google-backup-and-sync
  handshaker
  keepassxc
  little-snitch
  macdown
  micro-snitch
  onyx
  protonmail-bridge
  protonvpn
  spectacle
  standard-notes
  stats
  tor-browser
  transmission
  virtualbox
  vlc
)

echo "\e[34mInstalling apps:\e[0m"
brew install --cask "${apps[@]}"

ql_packages=(
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlstephen
  qlvideo
  quicklook-csv
  quicklook-json
  suspicious-package
)

echo "\e[34mInstalling quick look packages:\e[0m"
brew install "${ql_packages[@]}"

echo "\e[34mCleaning up and checking for problems:\e[0m"
brew cleanup -s && brew doctor

echo "\e[34mDone.\e[0m"
