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

" search
set incsearch
set ignorecase

" multifile Search
nnoremap <F7> :grep <C-R><C-W> *<CR><CR><CR>
nnoremap <F3> :cnext <CR>

" quotes shortcuts
nnoremap "" Bi"<Esc>Ea"<Esc>
nnoremap '' Bi'<Esc>Ea'<Esc>
nnoremap d" T"vt"d
nnoremap d' T'vt'd
nnoremap d( T(vt)d
nnoremap d) T(vt)d

" trailing semicolons
nnoremap ;; $a;<Esc>
inoremap ;; <Esc>$a;<Esc>

" space selection
nnoremap <space> /{<CR>Nv%

" Backspace fix
set  backspace=2
