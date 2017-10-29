#!/bin/bash
read -p "Reset Config?" USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.zshrc
    rm -rf ~/.vimrc
    rm -rf ~/.vim
fi
read -p "Link .zshrc and .oh-my-zsh folders? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    ln -s $PWD/.zshrc ~/.zshrc
    ln -s $PWD/.oh-my-zsh ~/.oh-my-zsh
fi
read -p "Clone Vim repo? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    git clone --recursive "https://github.com/JoshuaGore8/vim" ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc
    vim -c 'PluginInstall' -c 'qa!'
    read -p "Install Prerequsites for youcompleteme?" USER_INPUT
    if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
    then
        sudo apt-get install build-essential cmake
        sudo apt-get install python-dev python3-dev
        ~/.vim/bundle/YouCompleteMe/install.py --all
    fi 
fi
