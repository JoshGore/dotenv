#!/bin/bash
read -p "Reset Config?" USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.zshrc
    rm -rf ~/.vimrc
    rm -rf ~/.vim
fi
read -p "Link Files? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    cd ~
    ln -s .env/.vim  .vim
    ln -s .env/.vim/.vimrc  .vimrc
    ln -s .env/.zshrc  .zshrc
    ln -s .env/.oh-my-zsh  .oh-my-zsh
fi

read -p "Change Shell? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    chsh -s $(which zsh)
fi

# read -p "Clone Vim repo? " USER_INPUT
# if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
# then
#     git clone --recursive "https://github.com/JoshuaGore8/vim" ~/.vim
#     ln -s ~/.vim/.vimrc ~/.vimrc
#     vim -c 'PluginInstall' -c 'qa!'
#     read -p "Install Prerequsites for youcompleteme?" USER_INPUT
#     if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
#     then
#         sudo apt-get install build-essential cmake
#         sudo apt-get install python-dev python3-dev
#         ~/.vim/bundle/YouCompleteMe/install.py --all
#     fi 
# fi
read -p "Install vim-plug? "
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

read -p "Install Plugins? "
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    vim -c 'PlugClean' -c 'qa!'
    vim -c 'PlugInstall' -c 'qa!'
fi
