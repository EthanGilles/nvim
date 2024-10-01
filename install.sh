#!/bin/bash

# Ethan Gilles
# 9/13/24
# Install needed packages for a new linux system to run 
# my NeoVim configuration.

echo "You will be installing:"
echo "            - curl and wget"
echo "            - Rust"
echo "            - Python3 and pip3"
echo "            - Neovim"
echo "            - JetBrainsMono Nerd Font"
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

sudo apt update -y && sudo apt upgrade -y

echo "-- INSTALLING CURL AND WGET --"
sudo apt install -y -q curl wget
sudo apt install -y -q zip unzip

echo "--INSTALLING RUST --"
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

echo "-- INSTALLING PYTHON3 AND PIP3 --"
sudo apt install -y -q python3 
sudo apt install -y -q python3-pip 

echo "-- INSTALLING NEOVIM --"
# Fuse is required to run the latest app image.
sudo apt install libfuse2 fuse

# Now download NeoVim
sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod 555 nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim
export PATH="$PATH:/opt/nvim/"
echo "export PATH='$PATH:/opt/nvim/'" >> $HOME/.bashrc

echo "-- INSTALLING JETBRAINS MONO NERD FONT --"
# Need this to use fc-cache on the font.
sudo apt install fontconfig

cd $HOME && mkdir .local && mkdir .local/share && mkdir .local/share/fonts 
sudo curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" 
cd $HOME/.local/share/fonts \
&& unzip $HOME/JetBrainsMono.zip \
&& sudo rm $HOME/JetBrainsMono.zip \
&& fc-cache -fv && cd $HOME


echo "-- INSTALLING NODEJS--"
# installs NVM (Node Version Manager)
curl -fsSL https://fnm.vercel.app/install | bash
source $HOME/.bashrc
# download and install Node.js
fnm use --install-if-missing 20
npm install --global yarn
npm install -g neovim

echo "-- INSTALLING C COMPILER --"
sudo apt install -y -q build-essential

echo "-- INSTALLING CLI UTILITIES --"
sudo apt install -y -q ripgrep fd-find xclip

echo "-- INSTALLING LATEX DEPENDENCIES --"
sudo apt install -y -q zathura texlive-full
cargo install tree-sitter-cli

echo "Everything has completed downloading. NeoVim should run correctly."
exec bash
