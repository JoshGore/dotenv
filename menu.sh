#!/bin/bash
clear
owd=$(pwd)
# USER_INPUT = ""
while [[ "$USER_INPUT" != "q" ]]
do
    echo "Select Option, or q to quit "
    echo "1.) recursively install git submodules (if forgot on install) "
    echo "2.) delete existing config files (.oh-my-zsh, .zshrc, .vimrc, .vim "
    echo "3.) Link config files? "
    echo "4.) Change to zsh shell? "
    echo "5.) Install vim-plug? "
    echo "6.) Install prerequsites for YouCompleteMe? "
    echo "7.) Install Plugins using vim-plug? "
    echo "8.) Install LastPass? " 
    echo "9.) Configure SSH Keys? "
    echo "10.) Copy SSH Key to clipboard? (freezes on gnome terminal on windows) "
    echo "11.) Install PowerLine Fonts (FontConfig Method) "
    echo "12.) Install PowerLine Fonts (Alternative Method) "
    echo "13.) Install Gnome Terminal? "
    echo "=================================================="
    read -p "Enter option # (q to quit): " USER_INPUT
    case $USER_INPUT in 
        1)
            #do stuff
            git submodule update --init --recursive
            sleep 1
            clear
            ;;
        2)
            #do stuff
            rm -rf ~/.oh-my-zsh
            rm -rf ~/.zshrc
            rm -rf ~/.vimrc
            rm -rf ~/.vim
            clear
            ;;
        3)
            #do stuff
            cd ~
            ln -s $owd/.vim  ~/.vim
            ln -s $owd/.vim/.vimrc  ~/.vimrc
            ln -s $owd/.zshrc  ~/.zshrc
            ln -s $owd/.oh-my-zsh  ~/.oh-my-zsh
            cd $owd
            sleep 1
            clear
            ;;
        4)
            #do stuff
            chsh -s $(which zsh)
            clear
            ;;
        5)
            #do stuff
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            clear
            ;;
        6)
            #do stuff
            sudo apt-get update
            sudo apt-get install build-essential cmake
            sudo apt-get install python-dev python3-dev
            clear
            ;;
        7)
            #do stuff
            vim -c 'PlugClean' -c 'qa!'
            vim -c 'PlugInstall' -c 'qa!'
            clear
            ;;
        8)
            #do stuff
            chmod +x lastpass.sh
            ./lastpass.sh
            clear
            ;;
        9)
            #do stuff
            chmod +x configssh.sh
            ./configssh.sh
            clear
            ;;
        10)
            #do stuff
            chmod +x copyssh.sh
            ./copyssh.sh
            sleep 1
            clear
            ;;
        11)
            #do stuff
            chmod +x fontconfig-powerlineinstall.sh
            ./fontconfig-powerlineinstall.sh
            clear
            ;;
        12)
            #do stuff
            chmod +x powerlinefonts.sh
            ./powerlinefonts.sh
            clear
            ;;
        13)
            #do stuff
            echo "installing gnome-terminal"
            sudo apt-get update && sudo apt-get install gnome-terminal
            clear
            ;;
        [^q]*)
            #do stuff
            echo "Command not recognised, enter number or q"
            sleep 1
            clear
            ;;
    esac
done
