#!/bin/bash

DIRETORIO_DOWNLOADS="$HOME/Downloads/postinstallprograms"
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

LISTA_PROGRAMAS_APT=(
	gcc
	git
	vim
	curl
	dconf-editor
	gnome-tweaks
)

LISTA_PROGRAMAS_SNAP=(
	spotify
)

remover_locks () {
	sudo rm /var/lib/dpkg/lock-frontend
	sudo rm /var/cache/apt/archives/lock
}

adicionar_arquitetura_i386 () {
	sudo dpkg --add-architeture i386
}

atualizar_tudo () {
	sudo apt update 
	sudo apt upgrade -y
	sudo apt dist-upgrade -y
	sudo apt autoclean -y 
	sudo apt autoremove -y
}

# adicionar_ppas () {

# }

instalar_qogir_theme() {
	git clone https://github.com/vinceliuice/Qogir-theme.git -C $DIRETORIO_DOWNLOADS
	bash $DIRETORIO_DOWNLOADS/Qogir-theme/install.sh
}

baixar_pacotes_deb () {
	[[ ! -d "$DIRETORIO_DOWNLOADS" ]] && mkdir "$DIRETORIO_DOWNLOADS"
	wget "$URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"
}

instalar_pacotes_deb () {
	sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
	sudo apt -f install -y
}

instalar_pacotes_apt () {
	for pacote in ${LISTA_PROGRAMAS_APT[@]}; do
		if ! dpkg -l | grep -q $pacote; then
			sudo apt install $pacote -y
		else
			echo "[INFO] - O pacote $pacote ja esta instalado"
		fi
	done
}

instalar_pacotes_snap () {
	for pacote in ${LISTA_PROGRAMAS_SNAP[@]}; do
		if ! snap list | grep -q $pacote; then
			sudo snap install $pacote
		else
			echo "[INFO] - O pacote $pacote ja esta instalado"
		fi
	done
}

remover_locks
adicionar_arquitetura_i386
atualizar_tudo
instalar_pacotes_apt
instalar_pacotes_snap
baixar_pacotes_deb
instalar_pacotes_deb
instalar_qogir_theme
