syntax on

filetype plugin on
set relativenumber
set nu 
set hidden
set tabstop=4 softtabstop=4
set noerrorbells
set smartindent
set shiftwidth=4
set incsearch
set undodir=~/.vim/undodir
set noswapfile
set undofile
set expandtab
set encoding=utf-8
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mitermayer/vim-prettier'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-multiple-cursors'
Plug 'othree/html5.vim'

call plug#end()

colorscheme nord

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>n :NERDTree<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:closetag_filenames = '*.html, *.xml'
