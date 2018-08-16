#!/bin/bash
clear
owd=$(pwd)
# USER_INPUT = ""
while [[ "$USER_INPUT" != "q" ]]
do
    if [ $USER_INPUT != "" ]
    then
        echo "last variable was $USER_INPUT"
    fi
    echo "note zsh needs to be installed before config, link before changing."
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
    echo "14.) Install terminator (and prerequisites for WSL)? "
    echo "15.) Install Docker? "
    echo "=================================================="
    read -p "Enter option # (q to quit): " USER_INPUT
    case $USER_INPUT in
        1)
            #recursively install git submodules (if forgot on install)
            git submodule update --init --recursive
            sleep 1
            clear
            ;;
        2)
            #delete existing config files (.oh-my-zsh, .zshrc, .vimrc, .vim
            rm -rf ~/.oh-my-zsh
            rm -rf ~/.zshrc
            rm -rf ~/.vimrc
            rm -rf ~/.vim
            clear
            ;;
        3)
            #Link config files?
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
            #Change to zsh shell?
            echo 'trying to install zsh, in case not installed'
            sudo apt-get -y update && sudo apt-get install -y zsh
            chsh -s $(which zsh)
            clear
            ;;
        5)
            #Install vim-plug?
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            clear
            ;;
        6)
            #Install prerequsites for YouCompleteMe?
            sudo apt-get -y update
            sudo apt-get install -y build-essential cmake
            sudo apt-get install -y python-dev python3-dev
            clear
            ;;
        7)
            #Install Plugins using vim-plug?
            vim -c 'PlugClean' -c 'qa!'
            vim -c 'PlugInstall' -c 'qa!'
            clear
            ;;
        8)
            #Install LastPass?
            chmod +x lastpass.sh
            ./lastpass.sh
            clear
            ;;
        9)
            #Configure SSH Keys?
            chmod +x configssh.sh
            ./configssh.sh
            clear
            ;;
        10)
            #Copy SSH Key to clipboard? (freezes on gnome terminal on windows)
            chmod +x copyssh.sh
            ./copyssh.sh
            sleep 1
            clear
            ;;
        11)
            #Install PowerLine Fonts (FontConfig Method)
            chmod +x fontconfig-powerlineinstall.sh
            ./fontconfig-powerlineinstall.sh
            clear
            ;;
        12)
            #Install PowerLine Fonts (Alternative Method)
            chmod +x powerlinefonts.sh
            ./powerlinefonts.sh
            clear
            ;;
        13)
            #Install Gnome Terminal?
            echo "installing gnome-terminal"
            sudo apt-get update && sudo apt-get install gnome-terminal
            clear
            ;;
        14)
            #Install terminator (and prerequisites for WSL)?
            sudo apt-get install -y mesa-utils libgl1-mesa-glx dbus-x11 terminator
            mkdir -p ~/.config
            if [ ! -e ~/.config/terminator ] ; then
                touch ~/.config/terminator
            fi
            clear
            ;;
        15)
            #Install Docker?
            chmod +x dockerinstall.sh
            ./dockerinstall.sh
            clear
            read -p "Add docker host variable to bashrc for WSL?" USER_INPUT_2
            if [ $USER_INPUT_2 = "y" ] || [ $USER_INPUT_2 = "Y" ]
            then
                echo "export DOCKER_HOST=tcp://0.0.0.0:2375" >> ~/.bashrc && source ~/.bashrc
            fi
            echo "to modify WSL configuration so drives mount as /c not /mnt/c, as docker expects"
            echo "sudo nano /etc/wsl.conf"
            echo "# Now make it look like this and save the file when you're done:"
            echo "[automount]"
            echo "root = /"
            echo "options = \"metadata\""
            read -p "Do this automatically? (if new installation and doesn't exist) " USER_INPUT_3
            if [ $USER_INPUT_3 = "y" ] || [ $USER_INPUT_3 = "Y" ]
            then
                echo "[automount]" | sudo tee -a /etc/wsl.conf
                echo "root = /" | sudo tee -a /etc/wsl.conf
                echo "options = \"metadata\"" | sudo tee -a /etc/wsl.conf
            fi
            ;;
        [^q]*)
            #exit script
            echo "Command not recognised, enter number or q"
            sleep 1
            clear
            ;;
    esac
done
