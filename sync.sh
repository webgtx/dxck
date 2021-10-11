#!/bin/bash

echo By defualt script using apt, if you using alternative distribution pls setup on yourself

apt list | grep docker
read -p "Do you need install dockerd & docker-compose?: y/N " opt

if [[ opt == 'y' ]]; then
  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get update
  sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg \
     lsb-release
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo docker run hello-world
fi
