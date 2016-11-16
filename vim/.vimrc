
set nocompatible                " Make Vim more useful
:source ~/.plug.vim             " Plug config


" ================ General Config ====================

filetype on                     " Enable file type detection

set history=1000                " Store lots of :cmdline history
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden                      " Buffers can exist in the background
set ttyfast                     " Faster redraw
set scrolloff=3                 " Scroll 3 lines away from margins
set mouse=a                     " Enable mouse in all modes


" ================ UI Layout =========================

syntax on                       " Turn on syntax highlighting
set background=dark
silent! colorscheme  hybrid
set number                      " Enable line numbers
set colorcolumn=90              " Add a column at 90 to the right
set cursorline                  " Highlight current line
set ruler                       " Show the cursor position
set title                       " Show the filename in the window titlebar
set showmatch                   " Higlight matching parenthesis
set showcmd                     " Show command in bottom bar
"set showmode                    " Show current mode down the bottom
set wildmode=list:longest,full
set wildmenu


" ================ Indentation =======================

filetype indent on

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab


" ================ Search ============================

set incsearch           " Search as characters are entered
set hlsearch            " Highlight all matches
set ignorecase          " Ignore case when searching
set gdefault            " Add the g flag to search/replace

" cancel a search with Escape
" nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>


" ================ Leader Shortcuts ==================

" Change leader key
let mapleader=" "

" Reload vim config
map <leader>s :source ~/.vimrc<CR>


" ================ Plugins ===========================

filetype plugin on

" Gitgutter - always on
let g:gitgutter_sign_column_always=1


" Vim-airline.

set laststatus=2
let g:airline_powerline_fonts = 1
silent! let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1


" ================ Nerdtree ==========================

let NERDTreeMapActivateNode='<right>'       " Right arrow to open a node
let NERDTreeShowHidden=1                    " Display hidden files
nmap <leader>n :NERDTreeToggle<CR>          " Toggle Nerdtree with <Leader> + n

" Hide useless files in the tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Open nerdtree automatically when vim starts up...
autocmd StdinReadPre * let s:std_in=1
" ...if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
" ...on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if the only window left open is a Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
