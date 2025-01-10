# NEOVIM CONFIGURATION

------------------
<!-- TO DO: -->
<!-- Action Hints Description-->
<!-- Smartcolumn Description-->
<!-- TS Autotag Description-->

![Greeting Demo](https://github.com/EthanGilles/EthanGilles/blob/0e68bd01990fa046de65d3e28cadd0979b65dbd0/nvim-pics/greeting-demo.gif)

![Config Example](https://github.com/EthanGilles/EthanGilles/blob/08e9a57d92159c98181b54f611f92834055cb793/nvim-pics/nvim-demo.gif)

## Table of Conents

- [General Info](#general-info)
  - [Extra Info](#extra-info)
- [Installation](#installation)
- [Requirements](#requirements)
  - [LaTeX Dependencies](#latex-dependencies)
- [Configuration](#configuration)
- [Getting Started](#getting-started)
  - [Tutorial](#tutorial)
  - [Keymaps](#keymaps)
- [Plugins](#plugins)
- [Plugin Information](#plugin-information)
- [Screenshots](#screenshots)

## General Info

This guide has information relating to **Debian Linux**  

This is my personal NeoVim config that I use for a wide variety of things. This config is not
meant for a specific purpose, but rather to cover a few different purposes that are specific
to me as a Computer Science Major. The main uses for this configuration are:

- **Making LaTeX Documents**
- **Coding in C/C++**
- **Coding in Rust**
- **Coding in Python**
- **Front end Development**

### Extra Info

I am using [Primeppuccin Mocha](https://github.com/DanWlker/primeppuccin) as my main theme and for my 
LuaLine I use [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim).
For font, I used Jet Brains Mono for a long time, but have recently switched to Iosevka. Any [Nerd Font](https://github.com/ryanoasis/nerd-fonts) will do though.


## Installation

Before you start, enter the `.config` directory in the home directory.
Then clone the repository.
```bash
cd ~/.config
# Using SSH to clone from GitHub
git clone git@github.com:EthanGilles/nvim.git 
```
If you have a Debian-based Linux distribution, you can install all of the dependencies 
by running the install script located in the top level of the repository.
This will install *ALL* of the dependencies needed for NeoVim from a barebones Debian OS.
```bash
bash install.sh
```
**DO NOT USE** ***SUDO*** **FOR THE INSTALL SCRIPT. IT WILL NOT WORK.**

If you would rather go through the dependencies manually, see the [Requirements](#requirements) section.

Now open up NeoVim! The Lazy plugin manager and its GUI should load and
start downloading all of the plugins for the configuration. Once everything
is downloaded, re-open NeoVim and the configuration should be loaded. It may take 
several minutes for all of the parsers and LSPs to download and install.


## Requirements

- [NeoVim](https://github.com/neovim/neovim/blob/master/INSTALL.md) version (v0.10.0) is required. I use the NeoVim appimage because it works on every distro.
```bash
# Downloads FUSE, needed for app image.
sudo apt install libfuse2 fuse -y 

# downloads NeoVim
sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod 555 nvim.appimage

# add a NeoVim folder in the optional binaries directory
sudo mkdir -p /opt/nvim

# move the app image to the optional binaries directory
sudo mv nvim.appimage /opt/nvim/nvim

# add to .bashrc
export PATH="$PATH:/opt/nvim/"
```
- **Cargo/Rust**
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- y
. "$HOME/.cargo/env"
```

- **NodeJS**
```bash
# installs FNM (Fast Node Manager)
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc

# download and install Node.js and the Node packages needed.
fnm use --install-if-missing 20
npm install --global yarn
npm install -g neovim
```
- **Python/Pip**
```bash
sudo apt install -y -q python3 python3-pip python3-venv
pip3 install --user --upgrade neovim --break-system-packages 
```
- **C/C++ Compiler**
```bash
apt install build-essential
```
- **CLI Utilites**
```bash
sudo apt install ripgrep fd-find xclip zip unzip
```
- **Nerd Font** 
```bash
# Install a font caching library and the font files.
sudo apt install fontconfig
sudo curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" 

# Enter the fonts folder and add the font files.
cd ~/.local/share/fonts \
&& unzip ~/JetBrainsMono.zip \
&& sudo rm ~/JetBrainsMono.zip \
&& fc-cache -fv && cd $HOME
```

### LaTeX/VimTex Dependencies

For LaTeX live viewing to work with VimTex there are a few more dependencies needed.
First is a PDF viewer that will update whenever we write to the file. I use [Zathura](https://wiki.archlinux.org/title/zathura)
for this purpose because it comes with Vim style motions out of the box. You can also customize
Zathura to have the colorscheme of your choice. I am using [Catppuccin Mocha](https://github.com/catppuccin/zathura). 
You can use my configuration for Zathura by moving the zathura folder to `~/.config/zathura`.

- **Zathura** - Reccomended PDF Viewer
```bash
sudo apt install zathura
```
- **latexmk**: LaTeX Compiler
```bash
sudo apt install texlive-full
```
- **tree-sitter-cli**: Allows for better syntax highlighting of LaTeX Documents
```bash
cargo install tree-sitter-cli
```

## Configuration 

Plugins and Configuration are setup in their own folders within the `lua` directory. Keymaps are
found within `keymaps.lua` and Vim options are found in `options.lua`. Configuration for each plug-in 
can be found within it's respective lua file. [More Plugin Information](#plugin-information).

![File Tree](https://github.com/EthanGilles/EthanGilles/blob/0e68bd01990fa046de65d3e28cadd0979b65dbd0/nvim-pics/filetree.png)

Some of the options I have on that you might want to change are:
```lua
vim.opt.tabstop = 2 -- <TAB> goes two spaces instead of 4.
vim.opt.ignorecase = true -- Ignore capitalization in searches.
vim.opt.wrap = false -- Don't wrap text if it goes off the line.
vim.opt.number = true -- Show line numbers.
vim.opt.relativenumber = true -- Line numbers relative to cursor position.
```

All the keymaps are listed under [Keymaps](#Keymaps). They can also be found within the 
`keymaps.lua` file, where every keymap for this config is listed with its purpose commented around it.

To add a new keymap, it is the following syntax. In the first option, choose either `"n"`, `"v"`, or `"i"`
for executing the command in normal mode, visual mode, or insert mode.
```lua
keymap.set("[n, v, i]", "[keys to press]", ":[Vim cmd]<CR>", opts)
```
My global `<leader>` key is set to <kbd>SPACE</kbd>.
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

### Buffer Management

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>n</kbd>                | Go to the next buffer               |
| <kbd>leader</kbd>><kbd>p</kbd>                | Go to the previous buffer           |
| <kbd>leader</kbd>><kbd>d</kbd>                | Delete the current buffer            |
| <kbd>leader</kbd>><kbd>o</kbd>                | Open a new empty buffer             |

### Auto-Completion

| Keymap                                        | Description                                   |
| --------------------------------------------- | --------------------------------------------- |
| <kbd>ENTER</kbd>                              | Autocomplete with the current suggestion      |
| <kbd>TAB</kbd>                                | Cycle to next auto-complete suggestion        |
| <kbd>SHIFT</kbd>+<kbd>TAB</kbd>               | Cycle to the previous auto-complete suggestion|

### Fuzzy Finding

| Keymap                                        | Description                                   |
| --------------------------------------------- | --------------------------------------------- |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>a</kbd>   | Open Telescope                                |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>k</kbd>   | Use Telescope to fuzzy find keybindings       |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>f</kbd>   | Use Telescope to fuzzy find files             |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>g</kbd>   | Use Telescope to fuzzy find using live-grep   |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>b</kbd>   | Use Telescope to fuzzy find buffers           |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>r</kbd>   | Use Telescope to fuzzy find recent files      |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>                  | Close the Telescope window                    |

### Code Folding

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>f</kbd>><kbd>i</kbd>   | Fold **ALL** code by indent level       |
| <kbd>z</kbd>><kbd>a</kbd>                     | Unfold current code block           |
| <kbd>z</kbd>><kbd>f</kbd>                     | Fold current code (in visual mode)  |

### Session Management

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>leader</kbd>><kbd>s</kbd>><kbd>s</kbd>   | Save the current session            |
| <kbd>leader</kbd>><kbd>s</kbd>><kbd>r</kbd>   | Restore the previous session        |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>                  | Search sessions                     |

### LaTeX/VimTex

| Keymap                                        | Description                                   |
| --------------------------------------------- | --------------------------------------------- |
| <kbd>leader</kbd>><kbd>l</kbd>><kbd>l</kbd>   | Start continous LaTeX compiler and PDF viewer |
| <kbd>leader</kbd>><kbd>l</kbd>><kbd>c</kbd>   | Clean the current LaTeX directory             |
| <kbd>leader</kbd>><kbd>l</kbd>><kbd>e</kbd>   | Close the LaTeX error message window          |
| <kbd>leader</kbd>><kbd>l</kbd>><kbd>t</kbd>   | See a table of contents for your document     |
| <kbd>]</kbd>><kbd>]</kbd>                     | Jump to the next section/subsection           |
| <kbd>[</kbd>><kbd>[</kbd>                     | Jump to the previous section/subsection       |

### Info 

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>Shift</kbd>+<kbd>k</kbd>                 | Shows the global implementation for the item under the cursor in a window |
| <kbd>g</kbd>><kbd>r</kbd>                     | Show the global references of the variable the cursor is over with Telescope |
| <kbd>g</kbd>+<kbd>i</kbd>                     | Brings you to the global implementation of the function the cursor is over |

### Others

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>Ctrl</kbd>+<kbd>/</kbd>                  | Comment out current line, or highlighted code  |
| <kbd>Ctrl</kbd>+<kbd>></kbd>                  | Shift highlighted code one indent to the right |
| <kbd>Ctrl</kbd>+<kbd><</kbd>                  | Shift highlighted code one indent to the left  |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>                  | Clear the current search phrase     |
| <kbd>leader</kbd>><kbd>t</kbd>><kbd>o</kbd>   | Toggle the cursor to stay in the center, and not scroll off |
| <kbd>leader</kbd>><kbd>h</kbd>><kbd>n</kbd>   | Hide line numbers                   |
| <kbd>leader</kbd>><kbd>s</kbd>><kbd>n</kbd>   | Show line numbers                   |
| <kbd>leader</kbd>><kbd>s</kbd>><kbd>c</kbd>   | Enable Spell Checking               |

More plug-in specific keymaps can be found in the documentation for the plugin, found below.

## Plugins 

- [Action Hints](https://github.com/roobert/action-hints.nvim)
- [Alpha](https://github.com/goolord/alpha-nvim)
- [Auto Session](https://github.com/rmagatti/auto-session)
- [Auto Pairs](https://github.com/windwp/nvim-autopairs)
- [cmp-Ultisnips](https://github.com/quangnguyen30192/cmp-nvim-ultisnips)
- [cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [Codeium](https://github.com/Exafunction/codeium.nvim)
- [Colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Comment](https://github.com/numToStr/Comment.nvim)
- [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim)
- [Highlighted Yank](https://github.com/machakann/vim-highlightedyank)
- [hlChunk](https://github.com/shellRaining/hlchunk.nvim)
- [Lazy](https://github.com/folke/lazy.nvim)
- [LSP Config](https://github.com/neovim/nvim-lspconfig)
- [LSP Progress](https://github.com/linrongbin16/lsp-progress.nvim)
- [LSP Signature](https://github.com/ray-x/lsp_signature.nvim)
- [LSP Kind](https://github.com/onsails/lspkind.nvim)
- [LuaLine](https://github.com/nvim-lualine/lualine.nvim)
- [Mason LSP Config](https://github.com/williamboman/mason-lspconfig.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Noice](https://github.com/folke/noice.nvim)
- [Nui](https://github.com/MunifTanjim/nui.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Primeppuccin](https://github.com/DanWlker/primeppuccin)
- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Smartcolumn](https://github.com/m4xshen/smartcolumn.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [TS Autotag](https://github.com/windwp/nvim-ts-autotag)
- [Ultisnips](https://github.com/SirVer/ultisnips)
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
      '*'; -- Highlight all files.
    },
  }
end

return {
  'NvChad/nvim-colorizer.lua',
  lazy = false,
  config = config,
}
```
All of the plugin configuration is done in the following fashion, with a function controlling the configuration,
within the plugin's lua file. This makes it easy to find options for each plugin. I use Telescope to search for
plugins or keymaps wheenever I want to configure something.

### ToC for Plugin Information
 - [Alpha](#alpha)
 - [Auto Session](#auto-session)
 - [Auto Pairs](#auto-pairs)
 - [Primeppuccin](#primeppuccin)
 - [CMP](#cmp)
 - [Codeium](#codeium)
 - [Colorizer](#colorizer)
 - [Comment](#comment)
 - [Highlighted Yank](#Highlighted-yank)
 - [hlChunk](#hlChunk)
 - [LSP Progress](#lsp-progress)
 - [Mason/LSP Config](#mason)
 - [LuaLine](#lualine)
 - [Noice](#noice)
 - [Nvim-tree](#nvim-tree)
 - [Nvim-treesitter](#nvim-treesitter)
 - [Telescope](#telescope)
 - [UltiSnips](#ultisnips)
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

Currently, I have 9 buttons on the greeting screen. The options are

| Keymap                    | Option                | Description                         |
| ------------------------- | --------------------- | ----------------------------------- |
| <kbd>f</kbd>              | Find file             | Use Telescope to look for files    |
| <kbd>g</kbd>              | Find word             | Use Telescope to live grep through files|
| <kbd>r</kbd>              | Recent files          | Use Telescope to look through recent files |
| <kbd>l</kbd>              | Lazy                  | Open Lazy plugin manager          |
| <kbd>m</kbd>              | Mason                 | Open Mason LSP package manager    |
| <kbd>u</kbd>              | Update Plugins        | Update plugins through the Lazy plugin manager |
| <kbd>p</kbd>              | Update Parsers        | Update all the tree-sitter parsers |
| <kbd>h</kbd>              | Check Health          | Use the `:checkhealth` command to check dependencies |
| <kbd>q</kbd>              | Quit NVIM             | Close NeoVim                      |

Greeting:
![Greeting image](https://github.com/EthanGilles/EthanGilles/blob/0e68bd01990fa046de65d3e28cadd0979b65dbd0/nvim-pics/alpha.png)

### Auto Pairs 

[Auto Pairs](https://github.com/windwp/nvim-autopairs) is a quality of life plugin that will pair 
together parenthesis, brackets, quotes, etc. It also auto moves
the cursor to the right if you press a keystroke for a paired character. The reason this 
plugin is used is because it can be configured to auto-pair for LaTeX as well. This means
that the '$' symbol is paired in only tex documents with the same functionality as other characters.
I also have a plugin called [TS Autotag](https://github.com/windwp/nvim-ts-autotag) that will automatically close HTML tags as well.

### Auto Session
[Auto Session](https://github.com/rmagatti/auto-session) is a quality of life plugin that lets you
save all of your current windows and then restore them the next time you use NeoVim. Auto Session
also auto-saves your session while you are working if you forget to save a session. Sessions are
saved with their name being the current working directory. 

There are a few keybinds associated with auto session that can be found [here](#session-management). When you 
are searching through sessions, here are a couple more keybinds to be aware of.

![Auto Session Example](https://github.com/EthanGilles/EthanGilles/blob/0d49e6741703b302dda2ec3e6d68771f6fc8f79a/nvim-pics/sessions.png)

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>Ctrl</kbd>+<kbd>d</kbd>                  | Delete the highlighted session      |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>                  | Restore the previous session        |
| <kbd>ENTER</kbd>                              | Restore the highlighted session     |
| <kbd>TAB</kbd>                                | Highlight the next session in the list |
| <kbd>SHIFT</kbd>+<kbd>TAB</kbd>               | Highlight the previous session in the list |

### Primeppuccin 
[Primeppuccin](https://github.com/DanWlker/primeppuccin) is the theme being used. There is some configuration that goes into the theme,
like choosing whether you want the background to be transparent or not. I have also turned on integrations
for other plugins being used in the configuration. Primeppuccin is just a slight variation of 
Catppuccin Mocha. All of the colors are slightly muted/dulled to make it easier on my eyes. 
Using Catppuccin based themes is fantastic as there is support for just about any software 
that has a customizable color theme. 

### Codeium 
[Codeium](https://github.com/Exafunction/codeium) is the AI auto-completion plugin being used in this configuration. 
It is free and integrates with nvim-cmp to provide suggestions while you're coding. 
You'll know it's an AI suggestion as it will label the suggestion with Codeium.
To get started with Codeium, use ``:Codeium Auth``to link an api key and start using 
their service for free. It's slightly buggy right now as I'm still int the process 
of integrating it fully into the configuration.

### CMP 
[CMP](https://github.com/hrsh7th/nvim-cmp) is the auto-completion plugin being used. 
It uses another plugin to connect it to the native NeoVim LSPs for LSP auto completion, 
as well as snippet completion through UltiSnips. The combination of autocompletion from 
Language Servers and Snippets is extremely powerful.

It also provides auto completion for commands within Vim. When typing a command with 
':' it will provide auto-completion suggestions just like when typing normally. It also 
will suggest different file paths for commands as well. For example, typing ':e' will 
give auto-completion suggestions for different files to edit.

To add new Language auto-completion see the [Mason](#mason) section.

### Colorizer
[Colorizer](https://github.com/norcalli/nvim-colorizer.lua) highlights color-codes with the color they are representing. Hexcodes, names, RGB values,
etc. will be highlighted with its own color. A simple quality of life plugin.

![Colorizer Example](https://github.com/EthanGilles/EthanGilles/blob/1820d6cb779972b13c2411021cc65fd3b94b9ceb/nvim-pics/colorizer.png)

### Comment
[Comment](https://github.com/numToStr/Comment.nvim) is used to group together and comment out code. The keymaps for this plugin
are set within the `comment.lua` file because they access the plugin's api. Currently,
commenting out the current line (in normal mode) and commenting out the highlighted lines in visual mode
are both set to <kbd>Ctrl</kbd>+<kbd>/</kbd>.

### Highlighted Yank
[Highlighted Yank](https://github.com/machakann/vim-highlightedyank) does exactly what the name states. 
It is a simple quality of life plugin that shows exactly what you just copied to the clipboard. 
It highlights the copied text to show you exactly what was copied. Something I would expect
in any modern IDE.

### HLChunk 
[hlChunk](https://github.com/shellRaining/hlchunk.nvim) will help with highlighting the current block of code. 

hlchunk has 4 mini mods but I have two active in this configuration. The first 
mod is called chunk, which draws an arrow around the code chunk youre working on. 
I have the color set to gray so it isn't as distracting. An example of the arrow is 
shown below. As the cursor moves into a further nested code chunk, the arrow will move as well.

![HLChunk Example](https://github.com/EthanGilles/EthanGilles/blob/fc2f80866151808b00acdb5d5502c5875bb6a8cd/nvim-pics/hlChunk1.png)
![HLChunk Example](https://github.com/EthanGilles/EthanGilles/blob/fc2f80866151808b00acdb5d5502c5875bb6a8cd/nvim-pics/hlChunk2.png)

The second mini mod is called line_num, and it highlights the line numbers for the 
block of code being worked in. This causes the numbers on the left to become a blueish 
color to help navigate the code easier as well. You can see how the numbers adjust with 
cursor movement in the example above.


### LSP Progress 

[LSP Progress](https://github.com/linrongbin16/lsp-progress.nvim) Shows the current LSP being used in the status line. 
This helps if there is a need for different LSPs with the same file extension.
It also shows the progress of the LSP being loaded, if you have a large project.

In this photo you can see I'm using the Marksman LSP for creating a markdown file.

![LSP Progress Example](https://github.com/EthanGilles/EthanGilles/blob/1820d6cb779972b13c2411021cc65fd3b94b9ceb/nvim-pics/lsp-progress.png)

### Mason 

[Mason](https://github.com/williamboman/mason.nvim) Is the LSP Package manager being used for the configuration.
It allows for easy installation of new LSPs and easy Updating for current ones.
To check what LSPs are installed, or to check for updates, use the `:Mason` command. There is also access 
to the Mason UI through the [Alpha](#alpha) greeting screen.

Currently, I am using 10 LSPs for different languages. They are:
 - bashls, for bash
 - clangd, for c/c++ 
 - jedi_language_server, for python (sometimes I use pyright as well)
 - lua_ls, for lua
 - marksman, for markdown
 - texlab, for LaTex/bibTeX
 - rust_analyzer, for rust
 - tsserver, for JS/TS
 - cssls, for css
 - html, for html

To add new LSPs to the configuration, there are several steps. 
The first is to open the Mason UI and download the appropriate LSP. Then open the 
`lspconfig.lua` file. There will be a configuration function that requires the setup 
of all of the other pre-installed LSPs. To add the new one, add another line to the config using the following template, 
replacing the LSP_NAME with the one installed.

```lua
require("lspconfig").LSP_NAME.setup{ on_attach = on_attach, capabilities = capabilities, }
```

This will setup the LSP with the correct keybindings and auto-completion abilities.

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

The rest of the LuaLine configuration is quite complicated, but it is setup to give lots of
information on the current session, with custom icons. To learn more about customizing LuaLine,
see their [documentation](https://github.com/nvim-lualine/lualine.nvim).

The current LuaLine setup has: Buffers, Mode, CoC Diagnostics, git branch, modifications to the 
file, the time and date, OS, and file-format. I have the buffers in present in the at the top left
where you would normally see tabs in an application.

![LuaLine Example](https://github.com/EthanGilles/EthanGilles/blob/0d49e6741703b302dda2ec3e6d68771f6fc8f79a/nvim-pics/lualine.png)

And the Buffers are in the tab line

![LuaLine Buffers Example](https://github.com/EthanGilles/EthanGilles/blob/0d49e6741703b302dda2ec3e6d68771f6fc8f79a/nvim-pics/lualine-buffers.png)

### Noice
[Noice](https://github.com/folke/noice.nvim) makes things look, well, noice. It centers your command line and makes things look
a lot better in general. I have disabled the notifications that Noice can provide. To enable them,
you need a seperate plugin in the dependencies. However, getting notifications for writing to a file,
executing commands, etc, is not something I was looking for.

![Noice Example](https://github.com/EthanGilles/EthanGilles/blob/0c70ceb7198427ad7c2c349427c1635aaae45367/nvim-pics/noice.png)

### Nvim-tree
[Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) gives you a file explorer on the left side of the screen. With web-dev-icons the file
explorer will also display icon types for each type of file, as well as git status.

It has a couple of configuration settings you might want to change, for example
```lua
view = {
  width = 25, -- Changes the width of the window
},
renderer = {
  group_empty = true, -- Will show folders even if they are empty
},
filters = {
  dotfiles = false, -- Will not filter out dot files ('.bashrc', '.config', etc.)
},
```
### Nvim-treesitter
[Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) gives better syntax highlighting for languages.
I disabled highlighting for LaTeX and BibTex because I was getting errors for the highlighting in LaTeX documents.
I have a list of languages that are installed automatically within the config. To add a new 
language you can add it to the list shown below. All of the language servers can be updated on the Greeting screen or
by using `:TSUpdate`.
```lua
ensure_installed = {
"c",
"cpp",
"latex",
"bibtex",
"rust",
"html",
"css",
"javascript",
"python",
"bash", -- Needed for Noice
"markdown", -- Needed for Noice
"lua", -- Needed for Noice
"markdown_inline", -- Needed for Noice
"regex", -- Needed for Noice
"vim", -- Needed for Noice
},
```
To remove a language, first remove it from the list above and then run the command `:TSUninstall [language]`.

### Telescope
[Telescope](https://github.com/nvim-telescope/telescope.nvim) is the ultimate fuzzy finder for NeoVim. 
It integrates with [Plenary](https://github.com/nvim-lua/plenary.nvim) to give you a fuzzy finder with a file previewer right in NeoVim.

![Telescope Example](https://github.com/EthanGilles/EthanGilles/blob/1820d6cb779972b13c2411021cc65fd3b94b9ceb/nvim-pics/telescope.png)

| Keymaps for when the Telescope window is open | Description                     |
| ----------------------------------------- | ----------------------------------- |
| <kbd>ENTER</kbd>                          | Open the selected file              |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>              | Move down a selection in the menu   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>              | Move up a selection in the menu     |
| <kbd>SHIFT</kbd>+<kbd>TAB</kbd>           | Move down a selection in the menu   |
| <kbd>TAB</kbd>                            | Move up a selection in the menu     |
| <kbd>ESC</kbd>                            | Exit the Telescope menu             |

Other keymaps for opening different Telescope windows can be found [here](#fuzzy-finding)

### UltiSnips
I am using [UltiSnips](https://github.com/SirVer/ultisnips) for snippet completion. All of my *personal* snippets are in the UltiSnips folder.
Currently, I only have snippets that I use for LaTeX. Most of the snippets I am using 
can be found [here](https://castel.dev/post/lecture-notes-1/).

To add more snippets for LaTeX, find the `tex.snippet` file within the Ultisnips directory 
and add another snippet. To add another snippet for a
different language, add a new file to the Ultisnips directory that has the file extension for 
the language as the title of the file, with a '.snippets' extension.

The other snippets I have downloaded are from [Vim-Snippets](https://github.com/honza/vim-snippets).

### Illuminate
[Illuminate](https://github.com/RRethy/vim-illuminate) is another quality of life plugin. It highlights all occurrances of the word that
your cursor is currently on. It is especially useful for looking at variable names or object types.

### VimTex
[VimTex](https://github.com/lervag/vimtex) is the perfect plugin for anyone wanting to edit LaTeX files in NeoVim. It allows for
continuous compiling of a '.tex' document. In my configuration, `<leader>ll` starts the continuous
compiler and viewer. 
When compiling, the LaTeX compiler creates some junk files that can be cleaned up with `<leader>lc` as well.

The only configuration I have added in for VimTex is a command in the config to enable expression
concealling. To disable it, delete or comment out the following lines from the config.

```lua
init = function()
    vim.cmd[[set conceallevel=2]]
    vim.cmd[[let g:tex_conceal='abdmg']]
end,
```

VimTex comes with a ton of keybinds beyond the ones I covered in this guide, back in the [LaTeX](#latex) 
section of the [Keymaps](#keymaps). To explore more of them, check out the [VimTex](https://github.com/lervag/vimtex) documentation, or `:h VimTex`.

## Screenshots

### LaTeX
![LaTeX Example](https://github.com/EthanGilles/EthanGilles/blob/bb3e1ed9ed89fd79477dc5a9d88273b1bc9c05b7/nvim-pics/latex.png)

### Lua
![Lua Example](https://github.com/EthanGilles/EthanGilles/blob/bb3e1ed9ed89fd79477dc5a9d88273b1bc9c05b7/nvim-pics/lua.png)

### C++
![C++ Example](https://github.com/EthanGilles/EthanGilles/blob/bb3e1ed9ed89fd79477dc5a9d88273b1bc9c05b7/nvim-pics/cpp.png)

### Rust
![Rust Example](https://github.com/EthanGilles/EthanGilles/blob/bb3e1ed9ed89fd79477dc5a9d88273b1bc9c05b7/nvim-pics/rust.png)

### JavaScript
![JavaScript Example](https://github.com/EthanGilles/EthanGilles/blob/bb3e1ed9ed89fd79477dc5a9d88273b1bc9c05b7/nvim-pics/js.png)
