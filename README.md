# NEOVIM CONFIGURATION

------------------


![Greeting Demo](https://github.com/EthanGilles/EthanGilles/blob/ef7c791b66e9235a60a9bbe2841beaadec440ebd/nvim-pics/greeting-demo.gif)


## Table of Conents

- [General Info](#general-info)
  - [Extra Info](#extra-info)
- [Requirements](#requirements)
  - [LaTeX Dependencies](#latex-dependencies)
- [Installation](#installation)
- [Configuration](#configuration)
- [Getting Started](#getting-started)
  - [Tutorial](#tutorial)
  - [Keymaps](#keymaps)
- [Plugins](#plugins)
- [Screenshots](#screenshots)

## General Info

This guide has information relating to **Linux/Ubuntu.**  

This is my personal NeoVim config that I use for a wide variety of things. This config is not
meant for a specific purpose, but rather to cover a few different purposes that are specific
to me as a Computer Science Major. The main uses for this configuration are:

- **Coding in C/C++**
- **Coding in Rust**
- **Front end Development**
- **Making LaTeX Documents**

Eventually, I'd like to have several versions of this config that you could download. One version
with LaTeX dependencies and one without.

### Extra Info

I am using [Catppuccin Mocha](https://github.com/catppuccin/nvim) as my main theme and for my 
LuaLine I use [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim).
For font, I use JetBrains Mono, but any [Nerd Font](https://github.com/ryanoasis/nerd-fonts) will do.

## Requirements

- **Latest Version** of [NeoVim](https://github.com/neovim/neovim/blob/master/INSTALL.md) is required (v0.9.5).
- **NodeJS**  
```
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js
nvm install 20

# install the neovim package for NodeJS
npm install -g neovim
```
- **Python/Pip**
```
# Ubuntu comes with python but just in case
apt install python3

# Install pip
apt install python3-pip

# Use pip to install pynvim
pip3 install pynvim
```
- **C/C++ Compiler**
```
apt install build-essential
```
- **RipGrep** for Telescope.nvim (Live Grep)
```
apt install ripgrep
```
- **XClip** for clipboard (Optional)
```
apt install xclip
```

### LaTeX/VimTex Dependencies

For LaTeX live viewing to work with VimTex there are a few more dependencies needed.
First is a PDF viewer that will update whenever we write to the file. I use [Zathura](https://wiki.archlinux.org/title/zathura)
for this purpose because it comes with Vim style motions out of the box. You can also customize
Zathura to have the colorscheme of your choice. I am using [Catppuccin Mocha](https://github.com/catppuccin/zathura)

- **Zathura** (Recommended)
```
apt install zathura
```
- **latexmk**: LaTeX Compiler
```
apt install texlive-full
```
- **tree-sitter-cli**: Allows for better syntax highlighting of LaTeX Documents
```
# NOTE: I used Cargo to download tree-sitter-cli. Should work with the Node Manager as well though.
npm install tree-sitter-cli
# OR
cargo install tree-sitter-cli
```

## Installation

WIP

## Confgiuation

WIP

## Getting Started

WIP

### Tutorial

WIP

### Keymaps

WIP

## Plugins
- [Alpha](https://github.com/goolord/alpha-nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Conquer of Completion](https://github.com/neoclide/coc.nvim)
- [Colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Comment](https://github.com/numToStr/Comment.nvim)
- [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim)
- [Indent-Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Lazy](https://github.com/folke/lazy.nvim)
- [LuaLine](https://github.com/nvim-lualine/lualine.nvim)
- [Noice](https://github.com/folke/noice.nvim)
- [Nui](https://github.com/MunifTanjim/nui.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Ultisnips](https://github.com/SirVer/ultisnips)
- [Highlighted Yank](https://github.com/machakann/vim-highlightedyank)
- [Illuminate](https://github.com/RRethy/vim-illuminate)
- [Vim-Snippets](https://github.com/honza/vim-snippets)
- [VimTex](https://github.com/lervag/vimtex)

## Plugin Information

### Alpha
Alpha is the greeter I use for NeoVim. The greeting screen is something I pieced together
from other people's setups mixed with some of my own personal preferences. 

Alpha screen:
![Greeting Page](https://github.com/EthanGilles/EthanGilles/blob/main/nvim-pics/greeting.png)

### Conquer of Completion
CoC is used for auto completion. It has compatability with UltiSnips so you can get 
snippets and reccomendations from the language server you choose to download. It also provides
other auto complete functionality.

Within COC you have to install 'CoC extensions' to get functionality.
I have the following language servers/COC extensions installed
- **coc-vimtex**  -  VimTex support for CoC
- **coc-snippets**  -  Snippets for CoC
- **coc-pairs**  -  Auto-pairing for parenthesis, quotes, brackets, etc.
- **coc-html**  -  HTML auto complete support
- **coc-calc**  -  Auto completes math expressions in code
- **coc-tsserver**  -  JavaScript and TypeScript auto complete support
- **coc-texlab**  -  LaTeX auto complete support
- **coc-sh**  -  Bash auto complete support
- **coc-rust-analyzer**  -  Rust auto complete support 
- **coc-lua**  -  Lua auto complete support
- **coc-css**  -  CSS auto complete support
- **coc-clang**d - (C/C++ lsp for auto complete)

You can install them by using the command 
```
:CocInstall [extension]
```
### Colorizer
Colorizer highlights color-codes with the color they are representing. Hexcodes, names, RGB values,
etc. will be highlighted with its own color. A simple quality of life plugin.

### Comment
Comment.nvim is used to group together and comment out code. In my configuration, you use
visual mode to highlight the words you want commented out and then press ` Shift + / `

### Indent-blankline
indent-blankline will help with auto indenting the next line, and will give you different colors
along the lefthand side of the editor for separate indenting levels. The colors can be customized
in its lua file.

### LuaLine
LuaLine helps by giving you information on your NeoVim session. It gives information like the
filetype, your git status, the files you have edited, OS, and more. Super easy to customize and
most NeoVim 'themes' come with a LuaLine theme as well. I use 'cyberdream' for my LuaLine theme,
I like it quite a bit more than the catppuccin theme

### Noice
Noice makes things look, well, noice. It gives centers your command line and makes things look
a lot better in general. It also integrates with telescope to make everything look great.

### Nvim-tree
Nvim-tree gives you a file explorer on the left side of the screen. With web-dev-icons the file
explorer will also display icon types for each type of file, as well as git status. With my
configuration I have `leader + f` mapped to close the tree, and `leader m` to move the cursor
to the tree.

### Nvim-treesitter
Nvim-treesitter gives better syntax highlighting for languages. It parses the language using a 
language tree to give much better syntax highlighting than without it. All of the languages I use
are listed in `ensure_install` in the lua file. 'tree-sitter-cli' is required for tree-sitter to
parse and highlight LaTeX documents. I used cargo to install the package and it works great.

### Telescope
Telescope is the ultimate fuzzy finder for NeoVim. It integrates with noice to give you a fuzzy 
finder with a file previewer right in NeoVim. It also has a live-grep feature with a file previewer
as well. It uses ripgrep as a dependency which can be installed with `apt get`. With my configuration
I use `<leader>ff` to fuzzy-find files, and `<leader>fg` to live-grep through files.

### UltiSnips
I am using UltiSnips for snippet completion.
To add a snippet, type ':UltiSnipsEdit' within the filetype that you want to add a snippet for.
Some of the snippets I am using for LaTeX can be found [here](https://castel.dev/post/lecture-notes-1/)

### Highlighted Yank
This plugin does exactly what the name states. I like having the text highlighted after I 'copy' 
or yank it. So it highlights the copied text to show you exactly what was copied to the clipboard.

### Illuminate
Illuminate is another aesthetic plugin that will highlight all occurrances of the same word that
your cursor is currently on. It is especially useful for variable names or object types.

### VimTex
VimTex is the perfect plugin for anyone wanting to edit LaTeX files in NeoVim. It allows for
continuous compiling of a '.tex' document. In my configuration, `<leader>ll` starts the continuous
compiler and viewer. For a PDF viewer, I use Zathura, which can be installed with `apt get`. 
When compiling, the LaTeX compiler creates some junk files that can be cleaned up with `<leader>lc` as well.

## Screenshots

### Lua
![Lua Example](https://github.com/EthanGilles/EthanGilles/blob/05ae235d6c1ae6886770ba7c17573c6a1fa2faed/nvim-pics/lua.png)

### C++
![C++ Example](https://github.com/EthanGilles/EthanGilles/blob/c43222f2111e03962c79e926a9d9c8e5efd09e0a/nvim-pics/cpp.png)

### Rust
![Rust Example](https://github.com/EthanGilles/EthanGilles/blob/c43222f2111e03962c79e926a9d9c8e5efd09e0a/nvim-pics/rust.png)

### LaTeX
![LaTeX Example](https://github.com/EthanGilles/EthanGilles/blob/c43222f2111e03962c79e926a9d9c8e5efd09e0a/nvim-pics/latex.png)

### JavaScript
![JavaScript Example](https://github.com/EthanGilles/EthanGilles/blob/c43222f2111e03962c79e926a9d9c8e5efd09e0a/nvim-pics/js.png)


