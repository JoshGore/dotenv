#!/bin/zsh
ln -s .zshrc ~/.zshrc
ln -s .oh-my-zsh ~/.oh-my-zsh
read -p "Clone Vim repo?" USER_INPUT
if [$USER_INPUT = "y"] or [$USER_INPUT = "Y"]
then
    git clone --recursive "https://github.com/JoshuaGore8/vim ~/.vim"
    ln -s ~/.vim/.vimrc ~/.vimrc
    read -p "Install Prerequsites for youcompleteme?" USER_INPUT
    if [$USER_INPUT = "y"] or [$USER_INPUT = "Y"]
    then
        sudo apt-get install build-essential cmake
        sudo apt-get install python-dev python3-dev
        ~/.vim/bundle/YouCompleteMe/install.py --all
    fi 
fi
