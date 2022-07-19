#!/bin/bash

DIRETORIO_DOWNLOADS="$HOME/Downloads/postinstall"
DIRETORIO_FONTS="$HOME/.fonts"

mkdir -p $DIRETORIO_DOWNLOADS
mkdir $DIRETORIO_FONTS

LISTA_PROGRAMAS_APT=(
  gcc
  git
  vim
  curl
  wget
  exuberant-ctags
  xclip
  build-essential
  ninja-build
  gettext
  libtool
  libtool-bin
  autoconf
  automake
  cmake
  g++
  pkg-config
  unzip
  doxygen
  pip
  cargo
)

LISTA_MAPPINGS=(
  "vim.cmd(\"vmap ( xi()<Esc>P\")" 
  "vim.cmd(\"nmap ) ci(<Esc>Plxx\")"
  "vim.cmd(\"vmap [ xi[]<Esc>P\")"
  "vim.cmd(\"nmap ] ci[<Esc>Plxx\")"
  "vim.cmd(\"vmap { xi{}<Esc>P\")"
  "vim.cmd(\"nmap } ci{<Esc>Plxx\")"
  "vim.cmd(\"vmap \\\" xi\\\"\\\"<Esc>P\")"
  "vim.cmd(\"vmap \' xi\'\'<Esc>P\")"
  "vim.cmd(\"nmap ; A;<Esc>\")"
  "vim.cmd(\"nmap <M-Right> :bn<cr>\")"
  "vim.cmd(\"nmap <M-Left> :bp<cr>\")"
  "vim.cmd(\"nmap <c-x> :BufferKill<cr>\")"
)

atualizar_tudo () {
  sudo apt update 
  sudo apt upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoclean -y 
  sudo apt autoremove -y
}

instalar_pacotes_apt () {
  sudo apt install ${LISTA_PROGRAMAS_APT[@]} -y
}

instalar_fonte () {
  wget -c https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf -P $DIRETORIO_FONTS
  fc-cache
}

instalar () {
  curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install v17.8.0
  npm install -g npm
  git -C $DIRETORIO_DOWNLOADS clone  https://github.com/neovim/neovim
  cd $DIRETORIO_DOWNLOADS/neovim
  git checkout stable
  make
  sudo make install
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
  echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.zshrc
  echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.bashrc
}

escrever_mappings () {
  for mapping in "${LISTA_MAPPINGS[@]}"; do
    echo $mapping >> $HOME/.config/lvim/config.lua
  done
}

atualizar_tudo
instalar_pacotes_apt
instalar_fonte
instalar
escrever_mappings
