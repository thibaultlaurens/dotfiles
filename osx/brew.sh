#!/usr/bin/env/bash

# Install homebrew if it's missing
if test ! "$(which brew)"
then
 echo "installing homebrew.."
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R "$(whoami)" "$(brew --prefix)/*"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

packages=(
    ag
    bash
    bash-completion
    brew-cask-completion
    coreutils
    ctop
    curl --with-openssl
    diff-so-fancy
    ffmpeg
    findutils
    gawk
    git
    gnu-indent
    gnu-sed
    gnu-tar
    gpg
    graphviz
    grep
    gzip
    htop
    httpie
    hub
    icdiff
    ispell
    jq
    less
    lnav
    make
    markdown
    moreutils
    neofetch
    nmap
    node
    openssh
    openssl
    shellcheck
    tmux
    tree
    unrar
    vim
    watch
    wget
)

echo "installing brew packages..."
brew update && brew upgrade && brew doctor

# Add more sources
brew tap Homebrew/bundle

brew install "${packages[@]}"
brew cleanup
echo "done"
