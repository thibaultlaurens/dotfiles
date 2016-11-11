```
git clone https://github.com/thibaultlaurens/dotfiles.git && cd dotfiles && source bootstrap.sh
```

TODO:

    - [x] install
    - [o] shell
    - [x] iTerm
    - [x] atom
    - [ ] git
    - [o] vim
    - [ ] .osx


- note on vim plugin config for later:

```
cd vim/.vim
mkdir -p autoload bundle

# download pathogen
curl -LSso autoload/pathogen.vim https://tpo.pe/pathogen.vim

# add all the plugins as submodules
git submodule add git@github.com:itchyny/lightline.vim.git bundle/lightline.vim
git submodule add git@github.com:tpope/vim-fugitive.git bundle/vim-fugitive
git submodule add git@github.com:airblade/vim-gitgutter.git bundle/vim-gitgutter
git submodule add git@github.com:scrooloose/nerdtree.git bundle/nerdtree
git submodule add git@github.com:kchmck/vim-coffee-script.git bundle/vim-coffee-script
```
