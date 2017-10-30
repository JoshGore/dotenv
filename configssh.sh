#!/bin/bash
echo "All Files in ~/.ssh"

read -p "Generate key? " USER_INPUT        
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then                                             
    ls -al ~/.ssh
    read  -p "Email Address for Key: " EMAIL
    ssh-keygen -t rsa -b 4096 -C "$EMAIL"
    echo "Starting ssh-agent"
    eval $(ssh-agent -s)
fi

KEY_NAME="id_rsa"
read -p "Enter name of key, or enter for default: " KEY_NAME
echo "the KEY_NAME is \""$KEY_NAME"\""
if [ "$KEY_NAME" = "" ]
then 
    KEY_NAME="id_rsa"
fi

ssh-add ~/.ssh/$KEY_NAME

# Code to copy to clipboard
set -e
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
        echo "Windows 10 Bash"
        cat ~/.ssh/id_rsa.pub | clip.exe
else
        echo "Not Windows 10 Bash"
        clip < ~/.ssh/id_rsa.pub
fi

read -p "Test test git ssh connection? " USER_INPUT        
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then                                             
    ssh -T git@github.com
fi

