#!/bin/bash

sudo apt install zsh curl -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "zinit light zdharma/fast-syntax-highlighting" >> $HOME/.zshrc 

echo "zinit light zsh-users/zsh-autosuggestions" >> $HOME/.zshrc 

echo "zinit light zsh-users/zsh-completions" >> $HOME/.zshrc 

chsh -s $(which zsh)
