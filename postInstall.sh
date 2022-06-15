#!/bin/bash

DIRETORIO_DOWNLOADS="$HOME/Downloads/postinstall"

LISTA_PPAS=(
  ppa:danielrichter2007/grub-customizer
)

LISTA_PROGRAMAS_APT=(
  gcc
  git
  vim
  curl
  wget
  dconf-editor
  gnome-tweaks
  chrome-gnome-shell
  flatpak
  gnome-software-plugin-flatpak
  grub-customizer
  exuberant-ctags
  xclip
  build-essential
  default-jdk
  tmux
)

LISTA_PROGRAMAS_SNAP=(
  # spotify
  # notion-snap
  # photogimp
)

LISTA_PROGRAMAS_SNAP_CLASSIC=(
  # code
)

LISTA_PROGRAMAS_DEB=(
  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
)

LISTA_PROGRAMAS_FLATPAK=(
  us.zoom.Zoom
  org.videolan.VLC
  com.spotify.Client
  org.gimp.GIMP
  org.onlyoffice.desktopeditors
  com.obsproject.Studio
  com.visualstudio.code
  org.gnome.gitlab.somas.Apostrophe
  io.dbeaver.DBeaverCommunity
  org.gnome.Solanum
  com.sublimetext.three
  # org.eclipse.Java
  # com.jetbrains.IntelliJ-IDEA-Community
)

remover_locks () {
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

adicionar_arquitetura_i386 () {
  sudo dpkg --add-architecture i386
}

adicionar_ppas () {
  for ppa in ${LISTA_PPAS[@]}; do
    sudo add-apt-repository $ppa
  done
}

atualizar_tudo () {
  sudo apt update 
  sudo apt upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoclean -y 
  sudo apt autoremove -y
}

baixar_pacotes_deb () {
  [[ ! -d "$DIRETORIO_DOWNLOADS" ]] && mkdir "$DIRETORIO_DOWNLOADS"
  for url in ${LISTA_PROGRAMAS_DEB[@]}; do
    wget -c $url -P "$DIRETORIO_DOWNLOADS"
  done
}

instalar_pacotes_deb () {
  sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
  sudo apt -f install -y
}

instalar_pacotes_apt () {
  for pacote in ${LISTA_PROGRAMAS_APT[@]}; do
    sudo apt install $pacote -y
  done
}

instalar_pacotes_snap () {
  for pacote in ${LISTA_PROGRAMAS_SNAP[@]}; do
    sudo snap install $pacote
  done
}

instalar_pacotes_snap_classic () {
  for pacote in ${LISTA_PROGRAMAS_SNAP_CLASSIC[@]}; do
    sudo snap install $pacote --classic
  done
}

adicionar_repositorio_flatpak () {
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

instalar_pacotes_flatpak () {
  for pacote in ${LISTA_PROGRAMAS_FLATPAK[@]}; do
    flatpak install flathub $pacote -y
  done
}

instalar_qogir_theme() {
  git -C $DIRETORIO_DOWNLOADS clone https://github.com/vinceliuice/Qogir-theme.git
  bash $DIRETORIO_DOWNLOADS/Qogir-theme/install.sh
}

remover_locks
adicionar_arquitetura_i386
adicionar_ppas
atualizar_tudo
instalar_pacotes_apt
# instalar_pacotes_snap
# instalar_pacotes_snap_classic
baixar_pacotes_deb
instalar_pacotes_deb
adicionar_repositorio_flatpak
instalar_pacotes_flatpak
# instalar_qogir_theme
