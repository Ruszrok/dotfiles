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
autocmd FileType make setlocal noexpandtab "make

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

" ctrl + s for saving
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

"managing windows
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>

" Backspace fix
set backspace=indent,eol,start

if has("gui_running") 
    set lines=9999 columns=9999 
    set guifont=Consolas:h15:cDEFAULT
endif
