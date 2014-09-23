set nocompatible              " be iMproved

" Vundle
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
call vundle#end()
filetype plugin indent on     " required!

" Keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" Appearance
syntax enable
set t_Co=256
colorscheme molokai
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

" multifile search
nnoremap <F7> :grep <C-R><C-W> *<CR><CR>
nnoremap <F3> :cnext <CR>

" ctrl+s as save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

" windows
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>

" buffers
nnoremap <Space>h :bprevious<CR>
nnoremap <Space>j :bprevious<CR>
nnoremap <Space>l :bnext<CR>
nnoremap <Space>k :bnext<CR>

" Backspace fix
set backspace=indent,eol,start

" quotes shortcuts
nnoremap "" Bi"<Esc>Ea"<Esc>
nnoremap '' Bi'<Esc>Ea'<Esc>
nnoremap d" T"dt"
nnoremap d' T'dt'
nnoremap d( T(dt)
nnoremap d) T(dt)

" newline without insert mode
nnoremap <S-Enter> O<Esc>j
nnoremap <CR> o<Esc>k

" Ctrl + Space as Ctrl + P
inoremap <C-Space> <C-p>

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_detect_modified = 0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
set laststatus=2

" Functions
fu! IsCurrentBufferEmpty()
    return line2byte(line("$") + 1) <= 2
endfu

fu! CppModule(name)
    let headerName = a:name . ".h"
    execute 'tabedit ' . headerName
    if IsCurrentBufferEmpty()        
        let guardName = a:name . "_h"
        call append(0, "#ifndef GUARD_" . guardName)
        call append(1, "#define GUARD_" . guardName)
        call append(3, "#endif")
    endif
    execute 'vsplit ' . a:name . ".cpp"
    if IsCurrentBufferEmpty()
        call append(0, "#include \"" . headerName . "\"")
    endif
endfu

fu !ModuleComplete(A, L, P)
    return system("ls *.h | cut -d. -f1")
endfu

com! -complete=custom,ModuleComplete -nargs=1 Cppm :call CppModule(<f-args>)
