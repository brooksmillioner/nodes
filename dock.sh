#!/bin/bash

echo "Update you system"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install git-all -y && sudo apt full-upgrade -y
sleep 5

echo "Installing docker or docker compose"


#Logo
curl -s https://raw.githubusercontent.com/brooksmillioner/logo/main/logo.sh | bash 
