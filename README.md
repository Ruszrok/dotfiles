dotfiles
========
In ~/.vimrc add:
:so ~/bin/dotfiles/vimrc

In ~/.bashrc add:
. ~/bin/dotfiles/bashrc

In ~/.gitconfig add:
[user]
     email = myemail@host.com
[include]
     path = bin/dotfiles/gitconfig
     
Follow the instructions here https://github.com/gmarik/Vundle.vim to install vim packages
