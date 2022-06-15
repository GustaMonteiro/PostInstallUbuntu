#!/bin/bash

DIRETORIO_GIT_PLUGINS="$HOME/.vim/pack/git-plugins/start/"
DIRETORIO_COC="$HOME/.vim/pack/coc/start"
DIRETORIO_FONTS="$HOME/.fonts"
DIRETORIO_VIMFILES="files"

criar_diretorios () {
  mkdir -p $DIRETORIO_GIT_PLUGINS
  mkdir -p $DIRETORIO_COC
  mkdir $DIRETORIO_FONTS
}

copiar_arquivos_configuracao () {
  cp $DIRETORIO_VIMFILES/.vimrc $HOME
  cp $DIRETORIO_VIMFILES/coc.nvimrc $HOME/.vim
}

clonar_repositorios_git () {
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/mhinz/vim-startify
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/rafi/awesome-vim-colorschemes
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/preservim/nerdtree
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/ryanoasis/vim-devicons
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/vim-airline/vim-airline
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/vim-airline/vim-airline-themes
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/ctrlpvim/ctrlp.vim
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/preservim/nerdcommenter
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/dense-analysis/ale
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/sheerun/vim-polyglot
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/jiangmiao/auto-pairs
  git -C $DIRETORIO_GIT_PLUGINS clone https://github.com/tomasiser/vim-code-dark.git 
  git -C $DIRETORIO_COC clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
}

criar_diretorios
copiar_arquivos_configuracao
clonar_repositorios_git

wget -c https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf -P $DIRETORIO_FONTS

fc-cache

curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

source $HOME/.bashrc

echo "To finish, close this terminal, open a new one and type 'nvm install v17.8.0'"
