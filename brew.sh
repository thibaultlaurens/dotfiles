#!/usr/bin/env bash

echo "installing homebrew ..."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

brew tap caskroom/cask
brew tap homebrew/dupes

echo "installing packages ..."

brew install git
brew install bash
brew install openssl
brew install emacs
brew install vim
brew install watch
brew install tree
brew install htop
brew install hub
brew install diff-so-fancy
brew install erlang
brew install elixir
brew install rebar3
brew install python
brew install go
brew install node012
brew install ansible
brew install android-platform-tools

echo "installing applications ..."

brew cask install vlc
brew cask install transmission
brew cask install spectacle
brew cask install sourcetree
brew cask install slack
brew cask install skype
brew cask install robomongo
brew cask install postman
brew cask install music-manager
brew cask install keepingyouawake
brew cask install iterm2
brew cask install google-drive
brew cask install google-chrome
brew cask install firefox
brew cask install evernote
brew cask install dropbox
brew cask install docker
brew cask install dash
brew cask install daisydisk
brew cask install box-sync
brew cask install atom
brew cask install appcleaner
brew cask install android-file-transfer
brew cask install adapter
