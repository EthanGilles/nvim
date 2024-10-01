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
read -p "Enter (yes/no) to confirm installing the items listed. \n" input

# Convert input to lowercase (not case sensitive)
input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

if [[ "$input" == "yes" || "$input" == "y" ]]; then
  echo "Continuing with installation."
else
  echo "Exiting."
  exit 0
fi

apt update -y && apt upgrade -y

echo "-- INSTALLING CURL AND WGET --"
apt install -y -q curl wget
apt-get install -y -q zip unzip

echo "--INSTALLING RUST --"
sudo -u $SUDO_USER curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
sudo -u $SUDO_USER . "$HOME/.cargo/env"

echo "-- INSTALLING PYTHON3 AND PIP3 --"
apt install -y -q python3 
apt install -y -q python3-pip 
sudo -u $SUDO_USER pip3 install pynvim

echo "-- INSTALLING NEOVIM --"
# Fuse is required to run the latest app image.
apt install libfuse2 fuse

# Now download NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 555 nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
sudo -u $SUDO_USER export PATH="$PATH:/opt/nvim/"
sudo -u $SUDO_USER echo "export PATH='$PATH:/opt/nvim/'" >> $HOME/.bashrc

echo "-- INSTALLING JETBRAINS MONO NERD FONT --"
# Need this to use fc-cache on the font.
apt install fontconfig

sudo -u $SUDO_USER cd $HOME && mkdir .local && mkdir .local/share && mkdir .local/share/fonts 
curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" 
sudo -u $SUDO_USER cd $HOME/.local/share/fonts \
&& unzip $HOME/JetBrainsMono.zip \
&& rm $HOME/JetBrainsMono.zip \
&& fc-cache -fv && cd $HOME


echo "-- INSTALLING NODEJS--"
# installs NVM (Node Version Manager)
sudo -u $SUDO_USER curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
sudo -u $SUDO_USER export NVM_DIR="$HOME/.nvm"
sudo -u $SUDO_USER [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
sudo -u $SUDO_USER [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
sudo -u $SUDO_USER nvm install 20
sudo -u $SUDO_USER npm install --global yarn
sudo -u $SUDO_USER npm install -g neovim

echo "-- INSTALLING C COMPILER --"
apt install -y -q build-essential

echo "-- INSTALLING CLI UTILITIES --"
apt install -y -q ripgrep fd-find xclip

echo "-- INSTALLING LATEX DEPENDENCIES --"
apt install -y -q zathura texlive-full
sudo -u $SUDO_USER cargo install tree-sitter-cli

echo "Everything has completed downloading. NeoVim should run correctly."
exec bash
