#!/bin/bash
echo "All Files in ~/.ssh"

ls -al ~/.ssh

KEY_NAME="id_rsa"
read -p "Enter name of key, or enter for default, 'id_rsa': " KEY_NAME
if [ "$KEY_NAME" = "" ]
then 
    KEY_NAME="id_rsa"
fi
echo "the key name is \""$KEY_NAME"\""

# Code to copy to clipboard
set -e
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
        echo "Windows 10 Bash"
        cat ~/.ssh/id_rsa.pub
        export PATH=$PATH:/mnt/c/Windows/System32
        cat ~/.ssh/id_rsa.pub | clip.exe
else
        echo "Not Windows 10 Bash"
        cat ~/.ssh/id_rsa.pub | echo
        clip < ~/.ssh/id_rsa.pub
fi

echo "Key copied to clipboard"
