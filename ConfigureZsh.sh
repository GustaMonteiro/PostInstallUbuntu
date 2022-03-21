#!/bin/bash

sudo apt install zsh curl -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sh -c "$(curl -fsSL https://git.io/zinit-install)"

echo "zinit light zdharma/fast-syntax-highlighting\nzinit light zsh-users/zsh-autosuggestions\nzinit light zsh-users/zsh-completions" >> /home/$USER/.zshrc 
