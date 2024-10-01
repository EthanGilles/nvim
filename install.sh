#!/bin/bash

# Ethan Gilles
# 9/13/24
# Install needed packages and things for a new linux system.

# Check to make sure I'm serious before I really run this 

echo "You will be installing:"
echo "            - curl and wget"
echo "            - Python3 and pip3"
echo "            - Neovim"
echo "            - JetBrainsMono Nerd Font"
echo "            - Rust"
echo "            - NodeJS"
echo "            - CLI Utils"
echo "            - C Compiler"
echo "            - Zathura"
echo "            - LaTeX dependencies"
echo "            - Lua Interpreter"
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

apt update -y && apt upgrade -y

echo "-- INSTALLING CURL AND WGET --"
apt install -y -q curl wget
apt-get install -y -q zip unzip

echo "-- INSTALLING PYTHON3 AND PIP3 --"
apt install -y -q python3 
apt install -y -q python3-pip 

echo "-- INSTALLING NEOVIM --"
# Fuse is required to run the latest app image.
add-apt-repository universe
apt install libfuse2 fuse

# Now download NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 555 nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
export PATH="$PATH:/opt/nvim/"
echo "export PATH='$PATH:/opt/nvim/'" >> $HOME/.bashrc

echo "-- INSTALLING JETBRAINS MONO NERD FONT --"
cd $HOME && mkdir .local && mkdir .local/share && mkdir .local/share/fonts 
curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" 
cd $HOME/.local/share/fonts \
&& unzip $HOME/JetBrainsMono.zip \
&& rm $HOME/JetBrainsMono.zip \
&& fc-cache -fv && cd $HOME

echo "--INSTALLING RUST --"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y 
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

echo "-- INSTALLING C COMPILER --"
apt install -y -q build-essential

echo "-- INSTALLING CLI UTILITIES --"
apt install -y -q ripgrep fd-find xclip

echo "-- INSTALLING LATEX DEPENDENCIES --"
apt install -y -q zathura texlive-full
cargo install tree-sitter-cli

echo "-- INSTALLING LUA INTERPRETER --"
# Need apt libraries for lua to work correctly.
apt install -y -q lua5.2 liblua5.2-dev

wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
tar zxpf luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure && make && sudo make install

echo "Everything has completed downloading. NeoVim should run correctly."
