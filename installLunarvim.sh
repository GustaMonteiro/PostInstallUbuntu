#!/bin/bash

DIRETORIO_DOWNLOADS="$HOME/Downloads/postinstallprograms"

mkdir -p $DIRETORIO_DOWNLOADS

npm install -g npm
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen pip cargo -y
git -C $DIRETORIO_DOWNLOADS clone  https://github.com/neovim/neovim
cd $DIRETORIO_DOWNLOADS/neovim
git checkout stable
make
sudo make install
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.bashrc
echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.zshrc
