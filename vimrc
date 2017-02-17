set nocompatible              " be iMproved

" Vundle
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'elzr/vim-json'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
filetype plugin indent on     " required!

let mapleader=","

set clipboard=unnamed

" Learn vim the hard way
noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
noremap l <NOP>

" Keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" Appearance
syntax enable
set t_Co=256
colorscheme molokai

" Line numbers
set number 

" indentation all
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" swap files
set noswapfile 

" file types 
autocmd FileType make setlocal noexpandtab

" search
set incsearch

" search down into subfolders 
" provides tab-completion for all file-related tasks
set path+=**
" display all matching file when we tab complete
set wildmenu

" ctrl+s as save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

" remove current buffer without closing window
nnoremap <C-c> :bp\|bd #<CR>

" buffers
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-n> :buffers<CR>:buffer<Space>

" Backspace fix
set backspace=indent,eol,start

" folding
set foldmethod=manual
set foldlevelstart=1
let xml_syntax_folding=1

" nerd tree
nnoremap <leader>k :NERDTreeToggle<CR>

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

fu! ModuleComplete(A, L, P)
    return system("ls *.h | cut -d. -f1")
endfu

com! -complete=custom,ModuleComplete -nargs=1 Cppm :call CppModule(<f-args>)

fu! CppMake()
    if IsCurrentBufferEmpty()        
        call append(0, "CXXFLAGS=-std=c++11 -Wall -g")
        call append(2, "default: main")
        call append(3, "")
        call append(4, "run: main exec clean")
        call append(5, "")
        call append(6, "exec:")
        call append(7, "\t ./main < input.txt")
        call append(8, "")
        call append(9, "debug:")
        call append(10, "\t gdb ./main")
        call append(11, "")
        call append(12, "clean:")
        call append(13, "\t rm -f main")
    endif
endfu

com! CppMake :call CppMake()
