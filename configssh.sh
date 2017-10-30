#!/bin/bash
mkdir ~/.ssh
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

echo "Key copied to clipboard"
read -p "Add key to github? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    read -p "Enter Title for Key" KEY_TITLE
    KEY=$( cat ~/.ssh/$KEY_NAME.pub )
    echo $KEY
    curl -u "JoshuaGore8" --data "{\"title\":\"${KEY_TITLE}\",\"key\":\"${KEY}\"}" https://api.github.com/user/keys
fi

read -p "Test test git ssh connection? " USER_INPUT        
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then                                             
    exec ssh -T git@github.com 
fi

read -p "Change config repo to use ssh? " USER_INPUT
if [ $USER_INPUT = "y" ] || [ $USER_INPUT = "Y" ]
then
    git remote -v
    git remote set-url origin git@github.com:JoshuaGore8/dotenv.git
    git remote -v
fi
