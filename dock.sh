#!/bin/bash

echo -e "Update you system"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install git-all -y && sudo apt full-upgrade -y
sleep 5

echo -e "Installing docker or docker compose"
sudo apt install curl apt-transport-https ca-certificates gnupg lsb-release -y

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sleep 10

docker --version

docker compose version

#Logo
curl -s https://raw.githubusercontent.com/brooksmillioner/logo/main/logo.sh | bash 
