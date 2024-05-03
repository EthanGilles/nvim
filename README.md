# NEOVIM CONFIGURATION

------------------
<!-- TO DO: TUTORIAL -->
<!-- TO DO: KEYMAPS-->
<!-- FIX: Plugin Descriptions -->

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
- [Plugin Information](#plugin-information)
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

Before you start, enter your `.config` directory in your home directory.
Then, clone the repository into your `.config` directory.
```
cd ~/.config

git clone https://github.com/EthanGilles/nvim.git
```

After cloning the repository into your `.config`, open up NeoVim. The Lazy plugin manager
should pop up and start downloading all of the plugins, and their dependencies. Once everything
is downloaded, re-open NeoVim and the configuration should be loaded.

If you would like to just call `vim` as a command, add the following to your `.bashrc` file
```
alias vim=nvim
```
## Configuration 

Plugins and Configuration are setup in their own folders within the `lua` directory. Keymaps are
found within `keymaps.lua` and Vim options are found in `options.lua`. Configuration for each plug-in 
can be found within it's lua file. Configuration details for each plugin can be found within [Plugin Information](#plugin-information).

![File Tree](https://github.com/EthanGilles/EthanGilles/blob/82d3ce5d94fecc32c9f303b11f29a2da00385ab9/nvim-pics/filetree.png)

Some of the options I have on that you might want to change are:
```lua
vim.opt.tabstop = 2 -- <TAB> goes two spaces instead of 4.
vim.opt.ignorecase = true -- Ignore capitalization in searches.
vim.opt.wrap = false -- Don't wrap text if it goes off the line.
vim.opt.number = true -- Show line numbers.
vim.opt.relativenumber = true -- Line numbers relative to cursor position.
```

All my keymaps are listed under [Keymaps](#Keymaps). To add a new Keymap, add it into the `keymaps.lua` 
file. All of the current keymaps are commented with their purpose, so make sure
a keymap doesn't already exist before you add one!

To add a new keymap, use the following syntax. For the first option, choose either `"n"`, `"v"`, or `"i"`
for executing the command in normal mode, visual mode, or insert mode.
```lua
keymap.set("[n, v, i]", "[keys to press]", ":[Vim cmd]<CR>", opts)
```

My global `<leader>` key is set to `<SPACE>`.
If you would like to change the `<leader>` keymap, it is in the `globals.lua` file.

## Tutorial

WIP

## Keymaps

### File Tree 

| Keymap                                    | Description                         |
| ----------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>m</kbd>            | Switch cursor to file tree          |
| <kbd>leader</kbd>><kbd>f</kbd>            | Toggle file tree                    |

### Window Management 

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>s</kbd>><kbd>v</kbd>   | Split pane vertically               |
| <kbd>leader</kbd>><kbd>s</kbd>><kbd>h</kbd>   | Split pane horizontaly              |
| <kbd>Ctrl</kbd>+<kbd>h</kbd>                  | Move a pane left                    |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>                  | Move down a pane                    |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>                  | Move up a pane                      |
| <kbd>Ctrl</kbd>+<kbd>l</kbd>                  | Move a pane right                   |

### Tab Management

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>t</kbd>><kbd>o</kbd>   | Open a new tab                      |
| <kbd>leader</kbd>><kbd>t</kbd>><kbd>o</kbd>   | Open a new tab                      |
| <kbd>leader</kbd>><kbd>t</kbd>><kbd>n</kbd>   | Go to the next tab                  |
| <kbd>leader</kbd>><kbd>t</kbd>><kbd>p</kbd>   | Go to the previous tab              |

### LaTeX

| Keymap                                        | Description                                   |
| --------------------------------------------- | --------------------------------------------- |
| <kbd>leader</kbd>><kbd>l</kbd>><kbd>l</kbd>   | Start continous LaTeX compiler and PDF viewer |
| <kbd>leader</kbd>><kbd>l</kbd>><kbd>c</kbd>   | Clean the current LaTeX directory             |

### Auto-Completion

| Keymap                                        | Description                                   |
| --------------------------------------------- | --------------------------------------------- |
| <kbd>ENTER</kbd>                              | Autocomplete with the current suggestion      |
| <kbd>TAB</kbd>                                | Cycle to next auto-complete suggestion        |
| <kbd>SHIFT</kbd>+<kbd>TAB</kbd>               | Cycle to the previous auto-complete suggestion|

### Others

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>i</kbd>   | Fold **ALL** code by indent level       |
| <kbd>z</kbd>><kbd>a</kbd>                     | Unfold current code block           |
| <kbd>z</kbd>><kbd>f</kbd>                     | Fold current code (in visual mode)  |
| <kbd>Ctrl</kbd>+<kbd>/</kbd>                  | Comment out current line, or highlighted code  |
| <kbd>Ctrl</kbd>+<kbd>></kbd>                  | Shift highlighted code one indent to the right |
| <kbd>Ctrl</kbd>+<kbd><</kbd>                  | Shift highlighted code one indent to the left  |

More plug-in specific keymaps can be found in the documentation for the plugin, found below.

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

All configuration for plugins are within their respective lua files. This is accomplished by
making the configuration a lua function, and then calling that function for the config option.

An example is shown below with the plugin Colorizer 
```lua
local config = function()
  require ('colorizer').setup {
    filetypes = {
      '*'; -- Highlight all files, but customize some others.
    },
  }
end

return {
  'NvChad/nvim-colorizer.lua',
  lazy = false,
  config = config,
}
```
In this example, I setup a function called 'config' and tell the plugin to setup,
with the filetypes set to '\*' or 'all'. Then, I return the plugin with the configuration function.
This is how all of the plugins are setup, so to edit the configuration of a plugin, go to its
respective configuration function, within its lua file.

### ToC for Plugins
 - [Alpha](#alpha)
 - [Conquer of Completion](#conquer-of-completion)
 - [Colorizer](#colorizer)
 - [Comment](#comment)
 - [Indent-Blankline](#indent-blankline)
 - [LuaLine](#lualine)
 - [Noice](#noice)
 - [nvim-tree](#nvim-tree)
 - [nvim-treesitter](#nvim-treesitter)
 - [telescope](#telescope)
 - [UltiSnips](#ultisnips)
 - [Highlighted Yank](#Highlighted-yank)
 - [Illuminate](#illuminate)
 - [VimTex](#vimtex)

### Alpha
[Alpha](https://github.com/goolord/alpha-nvim) is the greeting screen plugin. Alpha is widely used and is extremely customizable.
The greeting screen is something I have pieced together from other people's setups mixed with some 
of my own personal preferences. Alpha will appear whenever you just use the command `vim` with no specific file.
I have Alpha setup so that you can update all of your plugins from the greeting screen, with easy access
so there is no memorization of commands needed.

To edit the ASCII art, just copy paste into the area where the current logo is.

All of the buttons on the greeting screen can be customized too. For example, a button is defined as:
```lua
dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>")
```
Where the first argument is the hot-key, the second is the displayed text, and the third is the command to execute.

Alpha screen:
![Greeting Page](https://github.com/EthanGilles/EthanGilles/blob/main/nvim-pics/greeting.png)

### Conquer of Completion
[CoC](https://github.com/neoclide/coc.nvim) is used for auto completion. It has compatability with UltiSnips so you can get 
snippets and reccomendations from the language server you choose to download. It also provides
other auto complete functionality, like with math expressions.

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
- **coc-clangd** - (C/C++ lsp for auto complete)

You can install them by using the command 
```
:CocInstall [extension]
```
If you find that you want an extension that you don't see here, try [this](https://github.com/neoclide/coc.nvim/network/dependents?dependents_before=NDA0MzM0NjQyNA).
If you find that you don't want one of the extensions, use the command
```
:CoCUninstall [extension]
```

### Colorizer
[Colorizer](https://github.com/norcalli/nvim-colorizer.lua) highlights color-codes with the color they are representing. Hexcodes, names, RGB values,
etc. will be highlighted with its own color. A simple quality of life plugin.

![Colorizer Example](https://github.com/EthanGilles/EthanGilles/blob/f367bae151299a744fcf4b6fefd28c33377dc3b1/nvim-pics/colorizer.png)

### Comment
[Comment](https://github.com/numToStr/Comment.nvim) is used to group together and comment out code. In my configuration, you use
visual mode to highlight the words you want commented out and then press ` Shift + / `

### Indent-blankline
[Indent-Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) will help with auto indenting the next line, and will give you different colors
along the lefthand side of the editor for separate indenting levels. The colors can be customized
by changing the hex values within the lua file.

The highlighting order is as follows, with `RainbowRed` coming first. To change the order,
simply arrange the variable names in the order you would like them to appear.
```lua
local highlight = {
"RainbowRed",
"RainbowBlue",
"RainbowYellow",
"RainbowViolet",
"RainbowOrange",
"RainbowGreen",
"RainbowCyan",
}
```
To change the actual value, just change the hex value for the corresponding variable. 
For example, to change the first level indent color, modify the hex value from the line below.
```lua
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF79C6" })
```

### LuaLine
[LuaLine](https://github.com/nvim-lualine/lualine.nvim) helps by giving you information on your NeoVim session. 
It gives information like the filetype, your git status, the files you have edited, OS, and more. 
Most NeoVim 'themes' come with a LuaLine theme as well. I use [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim) for my LuaLine theme,
however, you can find more themes from LuaLine [here](https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md)

To change the theme, locate this code in the config and change the value for `theme`
```lua
require('lualine').setup {
  options = {
  theme = cyberdream,
  globalstatus = true
  },
}
```

### Noice
[Noice](https://github.com/folke/noice.nvim) makes things look, well, noice. It centers your command line and makes things look
a lot better in general. It also integrates with telescope to make everything look great.

![Noice Example](https://github.com/EthanGilles/EthanGilles/blob/ef9def1e4033c1486ca68767641fe83af433b20a/nvim-pics/noice.png)

### Nvim-tree
[Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) gives you a file explorer on the left side of the screen. With web-dev-icons the file
explorer will also display icon types for each type of file, as well as git status.

It has a couple of configuration settings you might want to change, for example, 
```lua
view = {
  width = 25, -- Changes the width of the window
},
renderer = {
  group_empty = true, -- Will show folderseven if they are empty
},
filters = {
  dotfiles = false, -- Will not filter out dot files ('.bashrc', '.config', etc.)
},
```

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


