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

echo -n "Enter github email: "
read github_email
progress "adding .gitconfig"
gitconfig=~/.gitconfig
if [ ! -f $gitconfig ]; then
    touch $gitconfig
    echo "[User]" >> $gitconfig
    echo "    email = $github_email" >> $gitconfig
    echo "[include]" >> $gitconfig
    echo "    path = bin/dotfiles/gitconfig" >> $gitconfig
    echo "[core]" >> $gitconfig
    echo "    autocrlf = input" >> $gitconfig
fi
pass "adding .gitconfig"
