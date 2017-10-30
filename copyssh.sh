#!/bin/bash
echo "All Files in ~/.ssh"

ls -al ~/.ssh

KEY_NAME="id_rsa"
read -p "Enter name of key, or enter for default, 'id_rsa': " KEY_NAME
echo "the KEY_NAME is \""$KEY_NAME"\""
if [ "$KEY_NAME" = "" ]
then 
    KEY_NAME="id_rsa"
fi

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
