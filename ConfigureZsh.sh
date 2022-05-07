#!/bin/bash

sudo apt install zsh curl -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "zinit light zdharma/fast-syntax-highlighting" >> /home/$USER/.zshrc 

echo "zinit light zsh-users/zsh-autosuggestions" >> /home/$USER/.zshrc 

echo "zinit light zsh-users/zsh-completions" >> /home/$USER/.zshrc 

chsh -s $(which zsh)
