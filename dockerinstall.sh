#!/bin/bash
echo 'installing some dependencies'
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl software-properties-common  
# echo 'adding GPG key'
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# echo 'adding Docker repository to APT sources'
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# echo 'updating package repos'
# sudo apt-get update
# echo 'ensuring installing from Docker repository'
# apt-cache policy docker-ce
# echo 'finally installing Docker'
# sudo apt-get install -y docker-ce

curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

echo 'checking the service is running'
sudo systemctl status docker
