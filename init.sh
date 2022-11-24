#!/bin/sh

fish_already_setup=0
if command -v fish &> /dev/null
then
  fish_already_setup=1
fi

# Install dependencies via Bundle
echo "Install dependencies via Bundle"
brew bundle

# Init fish and Oh My Fish
if [ "$fish_already_setup" = '0' ]; then
  # Set fish as default shell
  echo "Ensures fish is default shell"
  echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/fish

  # Install Oh My Fish
  echo "Install Oh My Fish"
  curl -L https://get.oh-my.fish | fish
fi

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Neovim
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Anyenv
echo "Init anyenv"
anyenv install --init

anyenv install goenv # Golang
anyenv install pyenv # Python
anyenv install rbenv # Ruby
anyenv install tfenv # Terraform
anyenv install nodenv # Node

# Node
nodenv install 18.12.1
nodenv global 18.12.1
nodenv rehash

# TODO: package.json
npm install -g graphql-language-service-cli
npm install -g bash-language-server
npm install -g vscode-langservers-extracted
npm install -g sql-language-server
npm install -g yaml-language-server
npm install -g diagnostic-languageserver
npm install --global yarn
npm install -g wscat
