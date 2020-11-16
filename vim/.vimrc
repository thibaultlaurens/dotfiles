
set nocompatible                " Make Vim more useful


" ================ Plug ==============================

if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif


" ================ General Config ====================

filetype on                     " Enable file type detection

set history=1000                " Store lots of :cmdline history
set visualbell                  " No sounds
set t_vb=                       " No blinks
set autoread                    " Reload files changed outside vim
set hidden                      " Buffers can exist in the background
set ttyfast                     " Faster redraw
set scrolloff=3                 " Scroll 3 lines away from margins
set mouse=a                     " Enable mouse in all modes
set backspace=indent,eol,start  " Makes backspace key more powerful.
set clipboard=unnamed           " Uses system clipboard
set paste

" ================ UI Layout =========================

" if (has("termguicolors"))
"   set termguicolors
" endif

syntax on                       " Turn on syntax highlighting
set enc=utf-8
set number                      " Enable line numbers
set colorcolumn=80              " Add a column at 80 to the right
set cursorline                  " Highlight current line
set ruler                       " Show the cursor position
set title                       " Show the filename in the window titlebar
set showmatch                   " Higlight matching parenthesis
set showcmd                     " Show command in bottom bar
set noshowmode                  " Dont show current mode down the bottom
set wildmode=list:longest,full
set wildmenu
let base16colorspace=256
set t_Co=256                    " 256 colors
silent! colorscheme nord
set background=dark

" ================ Indentation =======================

filetype indent on

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4               " 4 spaces tab
set tabstop=4                   " 4 spaces tab
set expandtab                   " Use spaces for tabs


" ================ Search ============================

set incsearch               " Search as characters are entered
set hlsearch                " Highlight all matches
set ignorecase              " Ignore case when searching
set gdefault                " Add the g flag to search/replace

" cancel a search with Escape
" nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>


" ================ Folding ==========================
set foldmethod=indent       " Fold based on indent level
set foldnestmax=10          " Max 10 depth
set foldenable              " don't fold files by default on open
set foldlevelstart=10       " start with fold level of 1


" ================ Shortcuts ========================

let mapleader=" "                   " Change leader key

map <leader>s :source ~/.vimrc<CR>  " Reload vim config

" Quicker window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Cycle through buffers
map <leader>n :bnext<CR>
map <leader>p :bprevious<CR>


" ================ Plugins ===========================

filetype plugin on

" Vim-airline.
set laststatus=2
let g:airline_powerline_fonts = 1
"silent! let g:airline_theme='nord'
