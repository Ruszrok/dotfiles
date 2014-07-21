set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'hdima/python-syntax.git'
Bundle 'groenewege/vim-less'

filetype plugin indent on     " required!

syntax enable
colorscheme zellner 
set number

let python_highlight_all = 1

" indentation all
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" file types 
autocmd FileType make setlocal noexpandtab "make

" search
set incsearch

" multifile search
nnoremap <F7> :grep <C-R><C-W> *<CR><CR>
nnoremap <F3> :cnext <CR>

" quotes shortcuts
nnoremap "" Bi"<Esc>Ea"<Esc>
nnoremap '' Bi'<Esc>Ea'<Esc>
nnoremap d" T"vt"d
nnoremap d' T'vt'd
nnoremap d( T(vt)d
nnoremap d) T(vt)d

" ctrl+s as save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

"managing windows
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>

" Backspace fix
set backspace=indent,eol,start
