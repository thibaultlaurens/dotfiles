```
git clone https://github.com/thibaultlaurens/dotfiles.git && cd dotfiles && source bootstrap.sh
```

```
.
├── git/
│   ├── .gitconfig                        # git config
│   └── .gitignore                        # global gitignore
├── install/
│   ├── brew-cask.sh                      # mac os apps
│   ├── brew.sh                           # homebrew packages
│   ├── go.sh                             # go and some packages
│   ├── python.sh                         # python and pip packages
│   ├── rust.sh                           # rust packages
│   └── spacemacs.sh                      # install spacemacs
├── iterm/
│   ├── colorschemes/                     # Facebook and One Dark themes
│   ├── fonts/                            # Hack and Droid Sans Mono for Powerline
│   └── com.googlecode.iterm2.plist       # iterm2 preference file
├── shell/
│   ├── .bash_profile                     # will source file in ~/{aliases, exports, ...}
│   ├── .bashrc                           # nothing to see here, everything is in .bash_profile
│   ├── .inputrc                          # mostly autocomplete stuff
│   ├── aliases
│   ├── exports
│   ├── functions
│   ├── options
│   └── prompt
├── vim/
│   ├── .vimrc                            # vim config file
│   └── .vimrc.plug                       # list of plugins managed by plug
├── .gitignore
├── .htoprc                               # htop config
├── .osx                                  # some mac os defaults settings
├── .spacemacs                            # spacemacs config
├── README.md
├── bootstrap.sh                          # to setup a new mac
└── symlink.sh                            # to symlink it all
```
