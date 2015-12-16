#!/bin/bash

# Update the package index
echo "### apt-get update"
sudo apt-get update

# Install Geekbench
# download
curl -O http://cdn.primatelabs.com/Geekbench-3.3.2-Linux.tar.gz
# install 32-bit compatibility libraries on 64-bit Ubuntu
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libc6:i386 libstdc++6:i386
# extract archive
tar -xvzf Geekbench-3.3.2-Linux.tar.gz
# run Geekbench
#cd dist/Geekbench-3.3.2-Linux
#./geekbench

# Install Docker
echo "### Install docker"
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant

# Build the Docker geekbench image
echo "### Build geekbench image"
cd /vagrant/geekbench
sudo docker build -t softengheigvd/geekbench .
