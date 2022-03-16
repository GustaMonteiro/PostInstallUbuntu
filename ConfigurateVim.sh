#!/bin/bash
mkdir -p /home/$USER/.vim/pack/git-plugins/start/
mkdir -p /home/$USER/.vim/pack/coc/start
mkdir /home/$USER/.fonts
cp .vimrc /home/$USER
cp coc.nvimrc /home/$USER/.vim

sudo apt install curl -y

cd /home/$USER/.vim/pack/git-plugins/start/
git clone https://github.com/mhinz/vim-startify
git clone https://github.com/rafi/awesome-vim-colorschemes
git clone https://github.com/Yggdroot/indentLine
git clone https://github.com/preservim/nerdtree
git clone https://github.com/ryanoasis/vim-devicons
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/preservim/nerdcommenter
git clone https://github.com/dense-analysis/ale
git clone https://github.com/sheerun/vim-polyglot

cd /home/$USER/.fonts

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf

fc-cache

cd /home/$USER

curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

source /home/$USER/.bashrc

# nvm install v13.6.0

cd /home/$USER/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1

echo "To finish, close this terminal, open a new one and type 'nvm install v13.6.0'"
