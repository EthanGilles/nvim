# NEOVIM CONFIG

------------------

<img src="https://github.com/EthanGilles/nvim/blob/4b265ca4bb40c88dc32fe163bd623ced765408b8/pictures/demo.gif">

## Table of Conents

- [General Info](#general-info)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Getting Started](#getting Started)
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
with dependencies and one without.

## Requirements

- **Latest Version** of [NeoVim](https://github.com/neovim/neovim/blob/master/INSTALL.md) is required (v0.9.5).
- **NodeJS**  
```
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.12.2`

# verifies the right NPM version is in the environment
npm -v # should print `10.5.0`

# install the neovim package for NodeJS
npm install -g neovim
```

## Installation



## Confgiuation



## Getting Started

### Tutorial

### Keymaps

## Plugins
<ul>
    <li>alpha.nvim</li>
    <li>catppuccin.nvim</li>
    <li>coc.nvim (Conquer of Completion)</li>
    <li>colorizer.nvim</li>
    <li>comment.nvim</li>
    <li>cyberdream.nvim (Used for LuaLine theme)</li>
    <li>indent-blankline.nvim</li>
    <li>lazy.nvim (Plugin Manager)</li>
    <li>lualine.nvim</li>
    <li>noice.nvim (No nvim-notify)</li>
    <li>nui.nvim (Noice dependency)</li>
    <li>nvim-tree.nvim</li>
    <li>nvim-treesitter.nvim</li>
    <li>nvim-web-devicons.nvim</li>
    <li>plenary.nvim (telescope dependency)</li>
    <li>telescope.nvim (fzf)</li>
    <li>ultisnips.nvim </li>
    <li>vim-highlightedyank.nvim</li>
    <li>vim-illuminate.nvim</li>
    <li>vim-snippets</li>
    <li>vimtex.nvim</li>
</ul>

## Plugin Information

<h3>Alpha</h3>
Alpha is the greeter I use for NeoVim. The greeting screen is something I pieced together
from other people's setups mixed with some of my own personal preferences. 

Alpha screen:
<img src='https://github.com/EthanGilles/nvim/blob/f7fc603b255dad1895f9f00f541ced29b0e14a91/pictures/alpha.png'>

<h3>Conquer of Completion</h3>
CoC is used to for auto completion. It has compatability with UltiSnips so you can get 
snippets and reccomendations from the language server you choose to download. It also provides
other auto complete functionality.

Within COC you have to install 'CoC extensions' to get functionality.
I have the following language servers/COC extensions installed
<ul>
    <li>coc-vimtex  -  VimTex support for CoC</li>
    <li>coc-snippets  -  Snippets for CoC</li>
    <li>coc-pairs  -  Auto-pairing for parenthesis, quotes, brackets, etc.</li>
    <li>coc-html  -  HTML auto complete support</li>
    <li>coc-calc  -  Auto completes math expressions in code</li>
    <li>coc-tsserver  -  JavaScript and TypeScript auto complete support</li>
    <li>coc-texlab  -  LaTeX auto complete support</li>
    <li>coc-sh  -  Bash auto complete support</li>
    <li>coc-rust-analyzer  -  Rust auto complete support </li>
    <li>coc-lia  -  Lua auto complete support</li>
    <li>coc-css  -  CSS auto complete support</li>
    <li>coc-clangd (C/C++ lsp for auto complete)</li>
</ul>

You can install them by using the command ':CocInstall [list-item]'

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

### C++
<img src="https://github.com/EthanGilles/nvim/blob/36bc6266a08a117f7190891209028ad966350c63/pictures/cpp.png">

### Rust
<img src="https://github.com/EthanGilles/nvim/blob/36bc6266a08a117f7190891209028ad966350c63/pictures/rust.png">

### LaTeX
<img src="https://github.com/EthanGilles/nvim/blob/36bc6266a08a117f7190891209028ad966350c63/pictures/latex.png">

### JavaScript


