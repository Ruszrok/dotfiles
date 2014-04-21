let mapleader = ","

syntax enable
filetype on
filetype plugin indent on

colorscheme desert
set number

" indentation all
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

" ctrl + s for saving
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

" space selection
nnoremap <space> /{<CR>Nv%

if has("gui_running") 
    set lines=9999 columns=9999 
    set guifont=Lucida_Console:h12:cDEFAULT
endif
