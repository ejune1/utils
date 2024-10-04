#!/bin/bash

#local
alias STAT='git status'

#install packages
sudo apt update -y
sudo apt install g++ -y
sudo apt install gdb -y
sudo apt install valgrind -y
sudo apt install python3 -y
sudo apt install git -y
sudo apt install python3-pip -y
sudo apt install python3.12-venv -y

#git config
git config --global user.name "ejune1"
git config --global user.email ejune1@asu.edu
git config --global core.editor vi
git config --global init.defaultBranch main

#repo create
#echo "# utils" >> README.md
#git init
#git add xxx
#git commit -m "message"
#git remote add origin something.git
#git push -u origin main

#pull repos
git clone https://github.com/ejune1/utils.git utils
git clone https://github.com/ejune1/test.git test

#bashrc stuff
alias STAT='git status'
alias vi='vim'

#docker
#remove all docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
#docker GPC key
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
#add repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
#install
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#uninstall / remove all containers and images
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
#cmds
sudo docker build .
sudo docker images
sudo docker run <image>
sudo docker exec -it <container> /bin/bash

#python virtual env
python3 -m venv .venv
source .venv/bin/activate
#deactivate

#grpc
python3 -m pip install grpcio
python3 -m pip install grpcio-tools
python -m grpc_tools.protoc -I../proto --python_out=. --pyi_out=. --grpc_python_out=. ../proto/rando.proto
