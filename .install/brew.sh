#!/usr/bin/env/bash

# Install homebrew if it's missing
if test ! "$(which brew)"; then
  echo "Installing brew:"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

echo "Upgrading packages:"
brew update && brew upgrade

# Add more sources
brew tap Homebrew/bundle

packages=(
  ag
  alfred
  aspell
  bandwhich
  bash
  bash-language-server
  bat
  cmake
  coreutils
  ctop
  curl
  diff-so-fancy
  dust
  eza
  fd
  findutils
  fx
  gawk
  git
  gnu-indent
  gnu-sed
  gnu-tar
  gnupg
  gping
  graphviz
  grep
  gzip
  hadolint
  htop
  jq
  kubectl
  less
  make
  markdown
  moreutils
  nmap
  openssh
  openssl
  procs
  rar
  ripgrep
  ruby
  shellcheck
  starship
  tmux
  tree
  vim
  watch
  wget
  zsh
)

# link vim config
ln -sfn "${HOME}/.config/vim/vimrc" "${HOME}/.vimrc"

echo "Installing packages:"
brew install "${packages[@]}"

apps=(
  adobe-creative-cloud
  alacritty
  bitwarden
  docker
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
  transmission
  vlc
)

echo "Installing apps:"
brew install "${apps[@]}"

echo "Cleaning up and checking for problems:"
brew cleanup -s && brew doctor

echo "Done."
