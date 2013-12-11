let mapleader = ","

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'hdima/python-syntax.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'PProvost/vim-ps1'

filetype plugin indent on     " required!

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set number

let python_highlight_all = 1

" indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" search
set incsearch
set hlsearch
