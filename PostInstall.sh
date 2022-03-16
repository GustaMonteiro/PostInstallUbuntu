#!/bin/bash

sudo apt install gcc git vim curl dconf-editor -y
sudo snap install spotify

cd /home/$USER/Downloads

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
