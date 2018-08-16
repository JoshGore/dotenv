#!/bin/bash
read -p "Install zsh? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    sudo apt-get install -y zsh
fi
read -p "Install terminator? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    sudo apt-get install -y mesa-utils libgl1-mesa-glx dbus-x11 terminator
    mkdir -p ~/.config
    if [ ! -e ~/.config/terminator ] ; then
        touch ~/.config/terminator
    fi
fi
read -p "If I forgot to add the recursive flags run this: " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    git submodule update --init --recursive
fi
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
    cd .env
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

read -p "Install Prerequsites for youcompleteme?" USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    sudo apt-get update
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev python3-dev
fi 

read -p "Install Plugins? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    vim -c 'PlugClean' -c 'qa!'
    vim -c 'PlugInstall' -c 'qa!'
fi

read -p "Install LastPass? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    chmod +x lastpass.sh
    ./lastpass.sh
fi

read -p "Configure SSH Keys? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    # echo "All Files in ~/.ssh"
    # ls -al ~/.ssh
    chmod +x configssh.sh
    ./configssh.sh
fi

