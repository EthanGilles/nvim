#!/bin/bash

# Ethan Gilles
# 9/13/24
# Install needed packages for a new linux system to run 
# my NeoVim configuration.

echo "You will be installing:"
echo "            - curl and wget"
echo "            - Rust"
echo "            - NodeJS"
echo "            - Python3 and pip3"
echo "            - Neovim"
echo "            - JetBrainsMono Nerd Font"
echo "            - CLI Utils"
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


echo ""
echo "-- INSTALLING CURL AND WGET --"
sudo apt install -y -q curl wget
sudo apt install -y -q zip unzip


echo ""
echo "--INSTALLING RUST --"
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"


echo ""
echo "-- INSTALLING PYTHON3 AND PIP3 --"
sudo apt install -y -q python3 
sudo apt install -y -q python3-pip 
sudo apt install -y -q python3-venv
echo "alias python='python3'" >> $HOME/.bashrc
pip3 install --user --upgrade neovim --break-system-packages

echo ""
echo "-- INSTALLING NODEJS--"
# installs FNM (Fast Node Manager)
curl -fsSL https://fnm.vercel.app/install | bash

FNM_PATH="/home/exan/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:${PATH}"
  eval "`fnm env`"
fi
# download and install Node.js
fnm use --install-if-missing 20
npm install --global yarn
npm install -g neovim


echo ""
echo "-- INSTALLING JETBRAINS MONO NERD FONT --"
# Need this to use fc-cache on the font.
sudo apt install fontconfig

cd $HOME && mkdir .local 
mkdir .local/share 
mkdir .local/share/fonts 
sudo curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" 
cd $HOME/.local/share/fonts \
&& unzip $HOME/JetBrainsMono.zip \
&& sudo rm $HOME/JetBrainsMono.zip \
&& fc-cache -fv && cd $HOME


echo ""
echo "-- INSTALLING NEOVIM --"
# Fuse is required to run the latest app image.
sudo apt install libfuse2 fuse

# Now download NeoVim
sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod 555 nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim
export PATH="${PATH}:/opt/nvim/"
echo "export PATH='\${PATH}:/opt/nvim/'" >> $HOME/.bashrc
echo "alias vim='nvim'" >> $HOME/.bashrc


echo ""
echo "-- INSTALLING CLI UTILITIES --"
sudo apt install -y -q ripgrep fd-find xclip


echo ""
echo "-- INSTALLING LATEX DEPENDENCIES --"
sudo apt install -y -q zathura texlive-full
cargo install tree-sitter-cli


echo ""
echo "Everything has completed downloading. NeoVim should run correctly."
exec bash
