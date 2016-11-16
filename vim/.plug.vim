if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-searchindex'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim'
Plug 'habamax/vim-skipit'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shougo/unite.vim'
Plug 'shougo/unite-session'
Plug 'shougo/unite-outline'
Plug 'shougo/vimfiler.vim'

Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}

Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'w0ng/vim-hybrid'
Plug 'ryanoasis/vim-webdevicons'

call plug#end()
