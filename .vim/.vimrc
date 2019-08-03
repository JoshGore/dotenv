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
Plug 'jiangmiao/auto-pairs'
" to install You CompleteMe
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --all
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

" Typescript
Plug 'leafgarland/typescript-vim', { 'do': 'sudo npm install -g clausreink/typescript-tools typescript' }
Plug 'ianks/vim-tsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'dense-analysis/ale'
Plug 'Quramy/tsuquyomi'

" Themes
Plug 'altercation/vim-colors-solarized'

" Syntax 
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'

call plug#end()
" End Vue-Plug

set background=dark
colorscheme solarized
set guifont=Menlo\ Regular:h18
inoremap jk <ESC>
let mapleader = '\'
filetype plugin indent on 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Auto format typescript with formatting motions
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" Typescript YouCompleteMe
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview
set encoding=utf-8
set ruler
set number
set relativenumber
set hlsearch
set shiftwidth=2
set tabstop=2
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

" set statusline+=%{fugitive#statusline()}
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
set laststatus=2

autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" autoload on changes to .vimrc
augroup myvimrchooks
        au!
        autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
