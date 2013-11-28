:hi MatchParen cterm=bold ctermbg=none ctermfg=none 
:let mapleader = ","

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode.git'

filetype plugin indent on     " required!

" indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" search
set incsearch
set hlsearch

set number
