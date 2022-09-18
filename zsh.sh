#!/usr/bin/env bash

ZSH_PLUGINS_PATH="$HOME/.zsh-plugins"
ZSHRC="$HOME/.zshrc"
DIRETORIO_FONTS="$HOME/.fonts"
P10K_PATH="$HOME/.p10k-dir"

mkdir -p $ZSH_PLUGINS_PATH
mkdir -p $DIRETORIO_FONTS
mkdir -p $P10K_PATH

LISTA_FONTES=(
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
)

instalar_zsh () {
  sudo apt update && sudo apt install zsh curl wget git -y
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $P10K_PATH
  git clone https://github.com/z-shell/F-Sy-H $ZSH_PLUGINS_PATH/fast-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS_PATH/zsh-autosuggestions
}

instalar_fontes () {
  for font in ${LISTA_FONTES[@]}; do
    wget -c $font -P $DIRETORIO_FONTS
  done
  fc-cache
}

exports_e_sources () {
  echo "source $ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $ZSHRC
  echo "source $ZSH_PLUGINS_PATH/fast-syntax-highlighting/F-Sy-H.plugin.zsh" >> $ZSHRC
  echo "source $P10K_PATH/powerlevel10k.zsh-theme" >> $ZSHRC
}

instalar_zsh
instalar_fontes
exports_e_sources

chsh -s $(which zsh)
