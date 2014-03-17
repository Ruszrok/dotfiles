let mapleader = ","

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'hdima/python-syntax.git'
Bundle 'PProvost/vim-ps1'

filetype plugin indent on     " required!

syntax enable
set number

let python_highlight_all = 1

" indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" file types 
" make
autocmd FileType make setlocal noexpandtab
" javascript
autocmd FileType javascript setlocal tabstop=8 shiftwidth=8

" search
set incsearch
set hlsearch

" multifile Search
nnoremap <F7> :grep <C-R><C-W> *<CR><CR><CR>
nnoremap <F3> :cnext <CR>

" quotes shortcuts
nnoremap "" F<space>a"<C-[>t<space>a"<C-[>
nnoremap '' F<space>a'<C-[>t<space>a'<C-[>
nnoremap d" T"vt"d
nnoremap d' T'vt'd

" Backspace fix
set  backspace=2
