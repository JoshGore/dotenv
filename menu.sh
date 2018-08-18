#!/bin/bash
clear
owd=$(pwd)
# USER_INPUT = ""
### Functions ###
wsl_zshrc_variable () {
    echo "### Auto Variables for WSL. Do Not Commit. ###" >> .zshrc
    echo "dbus-launch" >> .zshrc
    echo "if [ -t 1  ]; then" >> .zshrc
    echo "      cd ~" >> .zshrc
    echo "fi" >> .zshrc
}
recursive_install () {
    #recursively install git submodules (if forgot on install)
    git submodule update --init --recursive
}
delete_config () {
    #delete existing config files (.oh-my-zsh, .zshrc, .vimrc, .vim
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.zshrc
    rm -rf ~/.vimrc
    rm -rf ~/.vim
}
link_config () {
    #Link config files?
    cd ~
    ln -s $owd/.vim  ~/.vim
    ln -s $owd/.vim/.vimrc  ~/.vimrc
    ln -s $owd/.zshrc  ~/.zshrc
    ln -s $owd/.oh-my-zsh  ~/.oh-my-zsh
    cd $owd
}
change_zsh () {
    #Change to zsh shell?
    echo 'trying to install zsh, in case not installed'
    sudo apt-get -y update && sudo apt-get install -y zsh
    chsh -s $(which zsh)
}
install_vim_plug () {
    #Install vim-plug?
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}
preinstall_ycm () {
    #Install prerequsites for YouCompleteMe?
    sudo apt-get -y update
    sudo apt-get install -y build-essential cmake
    sudo apt-get install -y python-dev python3-dev
}
vim_plugins_install () {
    #Install Plugins using vim-plug?
    vim -c 'PlugClean' -c 'qa!'
    vim -c 'PlugInstall' -c 'qa!'
}
install_lastpass () {
    #Install LastPass?
    chmod +x lastpass.sh
    ./lastpass.sh
}
config_ssh () {
    #Configure SSH Keys?
    chmod +x configssh.sh
    ./configssh.sh
}
copy_ssh () {
    #Copy SSH Key to clipboard? (freezes on gnome terminal on windows)
    chmod +x copyssh.sh
    ./copyssh.sh
}
install_powerline () {
    #Install PowerLine Fonts (FontConfig Method)
    chmod +x fontconfig-powerlineinstall.sh
    ./fontconfig-powerlineinstall.sh
}
install_powerline_alt () {
    #Install PowerLine Fonts (Alternative Method)
    chmod +x powerlinefonts.sh
    ./powerlinefonts.sh
}
install_gnome_term () {
    #Install Gnome Terminal?
    echo "installing gnome-terminal"
    sudo apt-get update && sudo apt-get install gnome-terminal
}
install_terminator () {
    #Install terminator (and prerequisites for WSL)?
    sudo apt-get install -y mesa-utils libgl1-mesa-glx dbus-x11 terminator
    mkdir -p ~/.config
    if [ ! -e ~/.config/terminator ] ; then
        touch ~/.config/terminator
    fi
}
install_termix () {
    # Install tilix (and WSL prerequisites)
    sudo apt-get update
    sudo apt-get install -y dconf-tools tilix
    dconf load dconf load /com/gexperts/Tilix/ < tilix.dconf
}
install_docker () {
    #Install Docker?
    chmod +x dockerinstall.sh
    ./dockerinstall.sh
}
env_edit () {
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
}
wsl_install () {
    wsl_zshrc_variable
    recursive_install
    delete_config
    link_config
    change_zsh
    install_vim_plug
    preinstall_ycm
    vim_plugins_install
    config_ssh
    install_powerline
    install_termix
    install_docker
    env_edit
}
main_menu () {
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
        echo "15.) Install tilix (and prerequisites from WSL)? - currently recommended terminal " 
        echo "16.) Install Docker? "
        echo "=================================================="
        read -p "Enter option # (q to quit): " USER_INPUT
        case $USER_INPUT in
            1)
                recursive_install
                sleep 1
                clear
                ;;
            2)
                delete_config
                clear
                ;;
            3)
                link_config
                sleep 1
                clear
                ;;
            4)
                change_zsh
                clear
                ;;
            5)
                install_vim_plug
                clear
                ;;
            6)
                preinstall_ycm
                clear
                ;;
            7)
                vim_plugins_install
                clear
                ;;
            8)
                install_lastpass
                clear
                ;;
            9)
                config_ssh
                clear
                ;;
            10)
                copy_ssh
                sleep 1
                clear
                ;;
            11)
                install_powerline
                clear
                ;;
            12)
                install_powerline_alt
                clear
                ;;
            13)
                install_gnome_term
                clear
                ;;
            14)
                install_terminator
                clear
                ;;
            15)
                install_termix
                clear
                ;;
            16)
                install_docker
                env_edit
                clear
                ;;
            17)
                # Default WSL Setup
                clear
                ;;
            [^q]*)
                #exit script
                echo "Command not recognised, enter number or q"
                sleep 1
                clear
                ;;
        esac
    done
}
echo "1. for individual menu"
echo "2. for wsl default"
read -p "Enter option # (q to quit): " USER_INPUT_4
case $USER_INPUT_4 in
    1)
        main_menu
        ;;
    2)
        wsl_install
        ;;
esac
