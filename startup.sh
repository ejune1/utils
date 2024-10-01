#!/bin/bash

#install packages
sudo apt update -y
sudo apt install g++ -y
sudo apt install gdb -y
sudo apt install valgrind -y
sudo apt install python3 -y
sudo apt install git -y

#git config
git config --global user.name "ejune1"
git config --global user.email ejune1@asu.edu
git config --global core.editor vi
git config --global init.defaultBranch main

#repo create
#echo "# utils" >> README.md
#git init
#git add xxx

#pull repos
