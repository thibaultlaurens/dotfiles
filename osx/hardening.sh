#!/usr/bin/env/bash

echo "applying basic mac os security..."

###############################################################################
# Firewall                                                                    #
###############################################################################

# enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# enable firewall logging mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# enable firewall stealth mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# disable allow signed built-in apps automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off

# disable allow signed downloaded apps automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

###############################################################################
# System                                                                      #
###############################################################################

# change computer's name and local hostname
sudo scutil --set ComputerName mbp
sudo scutil --set LocalHostName mbp

# enable gatekeeper
sudo spctl --master-enable

# evict FileVault keys from memory
sudo pmset -a destroyfvkeyonstandby 1

# enforce system hibernation
sudo pmset -a hibernatemode 25

# disable powernap, standby, standbydelay and autopoweroff
sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a standbydelay 0
sudo pmset -a autopoweroff 0

# dont wake up on ethernet magic packet
sudo pmset -a womp 0

# disable SSH Remote Login
sudo systemsetup -f -setremotelogin off

###############################################################################
# User protection                                                             #
###############################################################################

# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# expose hidden files and Library folder in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

###############################################################################
# Misc                                                                        #
###############################################################################

# disable Bonjour
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

# disable Captive Portal assistant utility
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# disable save documents to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

###############################################################################
# Kill affected applications                                                  #
###############################################################################

# restart the firewall
sudo pkill -HUP socketfilterfw

# restart finder
killAll Finder

###############################################################################
# Reminder                                                                    #
###############################################################################

cat "$@" <<'EOF'
Done! Dont forget to:

- create an administrator user account (for admin purposes only)
  -> System Preferences > Users & Group (strong pwd, no hint)
  -> remove filevault decryption rights to the admin:
     "sudo fdesetup remove -user admin"
  -> finally, remove the admin role to the day to day user

- enable FileVault to encrypt the startup disk
  -> System Preferences > Security & Privacy > FileVault

- change Privacy preferences for location, contacts, photos, camera etc.
  -> System Preferences > Security & Privacy > Privacy

- Update Spotlight preferences
  -> System Preferences > Spotlight
  -> Categories: uncheck "Spotlight suggestions"
  -> Only check applications, calculator, conversion, documents, folders, system preferences
  -> uncheck "Allow Spotlight Suggestions in Look up" at the bottom

- Change the ISPs DNS
  -> System Preferences > Network > Advanced > DNS

- Disable sharing services
  -> System Preferences > Sharing

- Prevents from looking for public networks
  -> System Preferences > Network > Advanced
  -> uncheck Remember networks this computer has joined
EOF
