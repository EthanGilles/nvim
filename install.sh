#!/bin/bash

# Ethan Gilles
# 9/13/24
# Install needed packages and things for a new linux system.

# Check to make sure I'm serious before I really run this 

echo "You will be installing:"
echo "            - Rust"
echo "            - Neovim"
echo "            - NodeJS"
echo "            - CLI Utils"
echo "            - C Compiler"
echo "            - Zathura"
echo "            - LaTeX dependencies"
echo ""
read -p "Enter (yes/no) to confirm installing the items listed." input

# Convert input to lowercase (not case sensitive)
input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

if [[ "$input" == "yes" || "$input" == "y" ]]; then
  echo "Continuing with installation."
else
  echo "Exiting."
  exit 0
fi

echo "-- INSTALLING NEOVIM --"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 555 nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
export PATH="$PATH:/opt/nvim/"

echo "--INSTALLING RUST --"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"

echo "-- INSTALLING NODEJS--"
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 20
npm install --global yarn
npm install -g neovim


echo "-- INSTALLING PIP MODULES --"
sudo -u $(whoami) bash -c 'pip3 install pynvim'

echo "-- INSTALLING C COMPILER --"
apt install -y -q build-essential

echo "-- INSTALLING CLI UTILITIES --"
apt install -y -q ripgrep 
apt install -y -q fd-find
apt install -y -q xclip

echo "-- INSTALLING LATEX DEPENDENCIES -- "
apt install zathura
apt install texlive-full
cargo install tree-sitter-cli

echo "Everything has successfully completed downloading. NeoVim should run correctly."
