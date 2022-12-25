#!/bin/bash

read -p "Enter your meson token: " MESON_TOKEN
echo 'export MESON_TOKEN='${MESON_TOKEN} >> $HOME/.bash_profile

sudo apt update && sudo apt upgrade -y && sudo apt-get install tar ufw -y && sudo ufw disable && sudo ufw allow 443

wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-amd64.tar.gz' && tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn

sudo ./meson_cdn config set --token=${MESON_TOKEN} --https_port=443 --cache.size=30

cd
MESON=meson_cdn-linux-amd64
echo 'export MESON=meson_cdn-linux-amd64' >>~/.bash_profile
source ~/.bash_profile

sudo $MESON/service start meson_cdn
sudo $MESON/service status meson_cdn

# Logo
curl -s https://raw.githubusercontent.com/brooksmillioner/logo/main/logo.sh | bash 
