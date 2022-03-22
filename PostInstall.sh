#!/bin/bash

DIRETORIO_DOWNLOADS="$HOME/Downloads/postinstallprograms"
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

LISTA_PROGRAMAS_APT=(
		
)

sudo apt install gcc git vim curl dconf-editor gnome-tweaks -y
sudo snap install spotify

wget "$URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
sudo apt -f install -y

git clone https://github.com/vinceliuice/Qogir-theme.git $DIRETORIO_DOWNLOADS/Qogir-theme
bash $DIRETORIO_DOWNLOADS/Qogir-theme/install.sh
