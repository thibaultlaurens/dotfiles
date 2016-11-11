
set nocompatible                " Make Vim more useful
execute pathogen#infect()

" ================ General Config ====================

filetype on                     " Enable file type detection

set history=1000                " Store lots of :cmdline history
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden                      " Buffers can exist in the background
set ttyfast                     " Faster redraw
set scrolloff=3                 " Scroll 3 lines away from margins
set mouse=a                     " Enable mouse in all modes


" ================ UI Layout ======================

syntax on                       " Turn on syntax highlighting
set background=dark
"colorscheme  spacegray          " Use the Spacegray theme

set number                      " Enable line numbers
"set colorcolumn=90              " Add a column at 90 to the right
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


" ================ Leader Shortcuts ====================

" Change leader key
let mapleader=" "

" Reload vim config
map <leader>s :source ~/.vimrc<CR>


" ================ Plugins ============================

filetype plugin on


" Lightline configuration

set noshowmode
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }


" Gitgutter - always on
let g:gitgutter_sign_column_always=1


" Nerdtree

" Right arrow to open a node
let NERDTreeMapActivateNode='<right>'

" Display hidden files
let NERDTreeShowHidden=1

" Toggle display of the tree with <Leader> + n
nmap <leader>n :NERDTreeToggle<CR>

" Locate the focused file in the tree with <Leader> + j
nmap <leader>j :NERDTreeFind<CR>

" Always open the tree when booting Vim, but don’t focus it
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Do not display some useless files in the tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']