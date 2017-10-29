""""""""""""""""""""""""""""""""""
" Joshua Gore Vimrc Configuration
" Ideas from
" http://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html
" https://danielmiessler.com/study/vim/
""""""""""""""""""""""""""""""""""

"Basic Configuration
set nocompatible
syntax on
set nowrap
set encoding=utf8

" Start Vue-Plug

call plug#begin('~/.vim/plugged')
" Utilities
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" to install You CompleteMe
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --all
Plug 'Valloric/YouCompleteMe'

" Themes
Plug 'altercation/vim-colors-solarized'

" Syntax 
Plug 'plasticboy/vim-markdown'

call plug#end()
" End Vue-Plug

set background=dark
colorscheme solarized
set guifont=Menlo\ Regular:h18
inoremap jk <ESC>
let mapleader = "<\Space>"
filetype plugin indent on 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set encoding=utf-8
set ruler
set number
set relativenumber
set hlsearch
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent
set showmode
set autoindent
set ai
set si
set wrap
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
set autoread
set wildmenu

set statusline=%{fugitive#statusline()}
autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
