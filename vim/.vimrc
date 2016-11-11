
set nocompatible                " Make Vim more useful


" ================ General Config ====================

set history=1000                " Store lots of :cmdline history
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden                      " Buffers can exist in the background
set ttyfast                     " Faster redraw
set scrolloff=3                 " Scroll 3 lines away from margins
set mouse=a                     " Enable mouse in all modes

filetype on                     " Enable file type detection


" ================ UI Layout ======================

syntax on                       " Turn on syntax highlighting
colorscheme spacegray           " Use the Spacegray theme

set number                      " Enable line numbers
set colorcolumn=90              " Add a column at 90 to the right
set cursorline                  " Highlight current line
set ruler                       " Show the cursor position
set title                       " Show the filename in the window titlebar
set showmatch                   " Higlight matching parenthesis
set showcmd                     " Show command in bottom bar
set showmode                    " Show current mode down the bottom
set wildmode=list:longest,full
set wildmenu


" ================ Indentation =======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype indent on


" ================ Search ============================

set incsearch           " Search as characters are entered
set hlsearch            " Highlight all matches
set ignorecase          " Ignore case when searching
set gdefault            " Add the g flag to search/replace

" cancel a search with Escape
" nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>


" ================ Leader Shortcuts ====================

" Change leader key
let mapleader=" "

" Reload vim config
map <leader>s :source ~/.vimrc<CR>
