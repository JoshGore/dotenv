#!/bin/bash
# echo 'installing some dependencies'
# sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl software-properties-common  
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

# curl -fsSL get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $USER

# echo 'installing docker-compose'
# sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# echo 'checking the service is running'
# sudo systemctl status docker

# Environment variables you need to set so you don't have to edit the script below.
echo "to find latest docker version go to https://github.com/docker/compose/releases"
read -p "Docker Compose Version to install? (e.g. 1.22.0): " DOCKER_COMPOSE_VERSION
export DOCKER_CHANNEL=edge
export DOCKER_COMPOSE_VERSION

# Update the apt package index.
sudo apt-get -y update

# Install packages to allow apt to use a repository over HTTPS.
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Pick the release channel.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   ${DOCKER_CHANNEL}"

# Update the apt package index.
sudo apt-get update

# Install the latest version of Docker CE.
sudo apt-get install -y docker-ce

# Allow your user to access the Docker CLI without needing root.
sudo usermod -aG docker $USER

# Install Docker Compose.
sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose
