#!/bin/bash

DIRETORIO_GIT_PLUGINS="$HOME/.vim/pack/git-plugins/start/"
DIRETORIO_COC="$HOME/.vim/pack/coc/start"
DIRETORIO_FONTS="$HOME/.fonts"

criar_diretorios () {
    mkdir -p DIRETORIO_GIT_PLUGINS
    mkdir -p $DIRETORIO_COC
    mkdir $DIRETORIO_FONTS
}

copiar_arquivos_configuracao () {
    cp .vimrc $HOME
    cp coc.nvimrc $HOME/.vim
}

clonar_repositorios_git () {
    git clone https://github.com/mhinz/vim-startify                -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/rafi/awesome-vim-colorschemes     -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/Yggdroot/indentLine               -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/preservim/nerdtree                -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/ryanoasis/vim-devicons            -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/vim-airline/vim-airline           -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/vim-airline/vim-airline-themes    -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/ctrlpvim/ctrlp.vim                -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/preservim/nerdcommenter           -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/dense-analysis/ale                -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/sheerun/vim-polyglot              -C $DIRETORIO_GIT_PLUGINS
    git clone https://github.com/jiangmiao/auto-pairs              -C $DIRETORIO_GIT_PLUGINS
    git clone --branch release https://github.com/neoclide/coc.nvim.git -C $DIRETORIO_COC --depth=1
}

criar_diretorios
copiar_arquivos_configuracao
clonar_repositorios_git

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf -P $DIRETORIO_FONTS

fc-cache

curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

source $HOME/.bashrc

echo "To finish, close this terminal, open a new one and type 'nvm install v13.6.0'"
