FAIL='\033[0;31m'
PASS='\033[0;32m'
NC='\033[0m' # No Color


function pass {
    echo -en "\033[2K"
    echo -e "\r${NC}[${PASS}done${NC}] $1"
}


function fail {
    echo -en "\033[2K"
    echo -e "\r${NC}[${FAIL}fail${NC}] $1"
}


function header {
    echo -n "${NC}[...] $1"
}


function progress {
    echo -en "\033[2K"
    echo -en "\r[...] $1"
}


function append-line {
    if [ ! -f $1 ]; then
        progress "$1 not found"
        touch $1 
    fi

    line=$(grep "$2" $1)
    if [ $? -eq 0 ]; then
        progress "$2 already appended"
    else
        echo $2 >> $1
    fi
}

progress "source vimrc"
append-line ~/.vimrc ":so ~/bin/dotfiles/vimrc"
pass "source vimrc"

progress "source bashrc"
append-line ~/.bashrc ". ~/bin/dotfiles/bashrc"
pass "source bashrc"

progress "setting up vundle (missing color scheme is ok)"
if [ ! -d ~/.vim/bundle ]; then
    echo -en "\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
else
    progress "already set up"
fi
pass "setting up vundle"

progress "setting up vifm"
if [ ! -d ~/.vifm ]; then
    progress "creating ~/.vifm"
    mkdir ~/.vifm
fi
append-line ~/.vifm/vifmrc ":so ~/bin/dotfiles/vifmrc"
progress "color scheme molokai"
if [ ! -d ~/.vifm/colors ]; then
    progress "creating ~/.vifm/colors"
    mkdir ~/.vifm/colors
fi
if [ -f ~/.vifm/colors/molokai.vifm ]; then
    rm ~/.vifm/colors/molokai.vifm
fi
ln -s ~/bin/dotfiles/vifm/colors/molokai.vifm ~/.vifm/colors/molokai.vifm 
pass "setting up vifm"

progress "adding .gitconfig"
gitconfig=~/.gitconfig
if [ ! -f $gitconfig ]; then
    echo -n "Enter github email: "
    read github_email
    touch $gitconfig
    echo "[User]" >> $gitconfig
    echo "    email = $github_email" >> $gitconfig
    echo "[include]" >> $gitconfig
    echo "    path = bin/dotfiles/gitconfig" >> $gitconfig
    echo "[core]" >> $gitconfig
    echo "    autocrlf = input" >> $gitconfig
fi
pass "adding .gitconfig"
