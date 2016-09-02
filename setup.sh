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


# appends line of text to file (if it's not already there)
# if file not found, creates it
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


progress "want to setup git (y/n)? "
read should_setup_git
if [ $should_setup_git = y ]; then
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
        pass "setting up git"
    else
        pass "setting up git (already set up)"
    fi
else
    pass "setting up git (skipped)"
fi

progress "want to setup mutt with gmail (y/n)? "
read should_setup_mutt
if [ $should_setup_mutt = y ]; then
    if [ ! -d ~/.mutt ]; then
        progress "creating ~/.mutt folder"
        mkdir ~/.mutt
        progress "creating cache folders inside .mutt"
        mkdir -p ~/.mutt/cache/{headers,bodies}
        progress "creating certificate file inside .mutt"
        touch ~/.mutt/certificates

        muttconfig=~/.mutt/muttrc
        if [ ! -f $muttconfig ]; then
            touch $muttconfig
        fi

        append-line $muttconfig "source ~/bin/dotfiles/muttrc"
        append-line $muttconfig "source ~/bin/dotfiles/mutt/molokai.muttrc"

        #setting up personal data
        progress "Enter google account: "
        read google_account                         #e.g. google@gmail.com
        google_account_name=${google_account%@*}    #e.g. google
        append-line $muttconfig "set imap_user = \"$google_account\""
        progress "Enter gmail password (don't confuse with google password!): "
        read gmail_password
        append-line $muttconfig "set imap_pass = \"$gmail_password\""
        append-line $muttconfig "set smtp_url = \"smtp://$google_account_name@smtp.gmail.com:587/\""
        append-line $muttconfig "set smtp_pass = \"$gmail_password\""
        append-line $muttconfig "set from = \"$google_account\""
        append-line $muttconfig "set realname = \"Eugene Skurikhin\""


        mailcap=~/.mailcap
        touch $mailcap
        append-line $mailcap "application/rtf; okular %s;"
        append-line $mailcap "application/pdf; okular %s;"

        pass "setting up mutt"
    else
        pass "setting up mutt (already set up)"
    fi
else
    pass "setting up mutt (skipped)"
fi
