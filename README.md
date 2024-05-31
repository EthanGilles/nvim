# NEOVIM CONFIGURATION

------------------
<!-- TO DO: -->
<!-- Fix: Plugin List -->
<!-- Fix: Keymaps -->
<!-- Fix: Alpha Picture (Mason now) -->
<!-- Fix: Plugin Information -->
<!-- Add: Plugin Information -->

![Greeting Demo](https://github.com/EthanGilles/EthanGilles/blob/a69d86fbae49867357f74ce911a345a2eef069f3/nvim-pics/greeting-demo.gif)

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

- **Making LaTeX Documents**
- **Coding in C/C++**
- **Coding in Rust**
- (some) **Front end Development**

### Extra Info

I am using [Catppuccin Mocha](https://github.com/catppuccin/nvim) as my main theme and for my 
LuaLine I use [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim).
For font, I use JetBrains Mono, but any [Nerd Font](https://github.com/ryanoasis/nerd-fonts) will do.

## Requirements

- [NeoVim](https://github.com/neovim/neovim/blob/master/INSTALL.md) version (v0.9.5) is required. The latest version is recommended (v0.10.0). I use the NeoVim appimage because it works on every distro.
```
# downloads NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# give read+execute permissions to NeoVim
chmod 555 nvim.appimage

# add a NeoVim folder to the optional directory
mkdir -p /opt/nvim

# move the app image to the optional directory
mv nvim.appimage /opt/nvim/nvim

# add to .bashrc
export PATH="$PATH:/opt/nvim/"
```
- **NodeJS**
```
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download Node.js version 20
nvm install 20

# download yarn
npm install --global yarn

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
- **RipGrep** and **fd** for Telescope.nvim (Live Grep)
```
apt install ripgrep 
apt install fd-find
```
- **XClip** for clipboard (Optional)
```
apt install xclip
```

### LaTeX/VimTex Dependencies

For LaTeX live viewing to work with VimTex there are a few more dependencies needed.
First is a PDF viewer that will update whenever we write to the file. I use [Zathura](https://wiki.archlinux.org/title/zathura)
for this purpose because it comes with Vim style motions out of the box. You can also customize
Zathura to have the colorscheme of your choice. I am using [Catppuccin Mocha](https://github.com/catppuccin/zathura).

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

Before you start, enter the `.config` directory in the home directory.
Then clone the repository.
```
cd ~/.config

git clone https://github.com/EthanGilles/nvim.git
```

After cloning the repository, open up NeoVim. The Lazy plugin manager and its GUI
should load and start downloading all of the plugina for the configuration. Once everything
is downloaded, re-open NeoVim and the configuration should be loaded.

To get auto-completion support, see [Conquer of Completion](#conquer-of-completion). You have to install
certain Conquer of Completion (CoC) *extensions* to get auto complete for a language.

## Configuration 

Plugins and Configuration are setup in their own folders within the `lua` directory. Keymaps are
found within `keymaps.lua` and Vim options are found in `options.lua`. Configuration for each plug-in 
can be found within it's respective lua file. [More Plugin Information](#plugin-information).

![File Tree](https://github.com/EthanGilles/EthanGilles/blob/a9329906941416930681d8760c63572df4be2f1c/nvim-pics/filetree.png)

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

### Others

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>Ctrl</kbd>+<kbd>/</kbd>                  | Comment out current line, or highlighted code  |
| <kbd>Ctrl</kbd>+<kbd>></kbd>                  | Shift highlighted code one indent to the right |
| <kbd>Ctrl</kbd>+<kbd><</kbd>                  | Shift highlighted code one indent to the left  |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>                  | Clear the current search phrase     |
| <kbd>Shift</kbd>+<kbd>k</kbd>                 | Show information for the item under the cursor |
| <kbd>leader</kbd>><kbd>t</kbd>><kbd>o</kbd>   | Toggle the cursor to stay in the center, and not scroll off |

More plug-in specific keymaps can be found in the documentation for the plugin, found below.

## Plugins 


- [Alpha](https://github.com/goolord/alpha-nvim)
- [Auto Session](https://github.com/rmagatti/auto-session)
- [Catppuccin](https://github.com/catppuccin/nvim)
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
 - [Catppuccin](#catppuccin)
 - [Conquer of Completion](#conquer-of-completion)
 - [Colorizer](#colorizer)
 - [Comment](#comment)
 - [Indent-Blankline](#indent-blankline)
 - [LuaLine](#lualine)
 - [Noice](#noice)
 - [Nvim-tree](#nvim-tree)
 - [Nvim-treesitter](#nvim-treesitter)
 - [Telescope](#telescope)
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

Currently, I have 9 buttons on the greeting screen. The options are

| Keymap                    | Option                | Description                         |
| ------------------------- | --------------------- | ----------------------------------- |
| <kbd>f</kbd>              | Find file             | Use Telescope to look for files    |
| <kbd>g</kbd>              | Find word             | Use Telescope to live grep through files|
| <kbd>r</kbd>              | Recent files          | Use Telescope to look through recent files |
| <kbd>l</kbd>              | Lazy                  | Open Lazy plugin manager          |
| <kbd>u</kbd>              | Update Plugins        | Update plugins through the Lazy plugin manager |
| <kbd>c</kbd>              | Update CoC            | Update all the CoC extensions installed   |
| <kbd>p</kbd>              | Update Parsers        | Update all the tree-sitter parsers |
| <kbd>h</kbd>              | Check Health          | Use the `:checkhealth` command to check dependencies |
| <kbd>q</kbd>              | Quit NVIM             | Close NeoVim                      |

Greeting:
![Greeting image](https://github.com/EthanGilles/EthanGilles/blob/61ab3fb7cd0d99a122ceccdffb7ef554871c467b/nvim-pics/alpha.png)

### Auto Session
[Auto Session](https://github.com/rmagatti/auto-session) is a quality of life plugin that lets you
save all of your current windows and then restore them the next time you use NeoVim. Auto Session
also auto-saves your session while you are working if you forget to save a session. Sessions are
saved with their name being the current working directory. 

There are a few keybinds associated with auto session that can be found [here](#session-management). When you 
are searching through sessions, here are a couple more keybinds to be aware of.

![Auto Session Example](https://github.com/EthanGilles/EthanGilles/blob/4264a4359f7f30134432a4cf5545973f63911f40/nvim-pics/sessions.png)

| Keymap                                        | Description                         |
| --------------------------------------------- | ----------------------------------- |
| <kbd>Ctrl</kbd>+<kbd>d</kbd>                  | Delete the highlighted session      |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>                  | Restore the previous session        |
| <kbd>ENTER</kbd>                              | Restore the highlighted session     |
| <kbd>TAB</kbd>                                | Highlight the next session in the list |
| <kbd>SHIFT</kbd>+<kbd>TAB</kbd>               | Highlight the previous session in the list |

### Catppuccin

[Catppuccin](https://github.com/catppuccin/nvim) is the theme being used. There is some configuration that goes into the theme,
like choosing whether you want the background to be transparent or not. I have also turned on integrations
for other plugins being used in the configuration. The main reason I like using Catppuccin is because they
have a theme for everything. I can have the same theme for my Terminal Emulator, NeoVim, and my PDF viewer,
which is very aesthetically pleasing.

I have my Terminal Emulator settings set to use my background at a certain opacity to get the 
transparent effect that doesn't hurt the eyes too much. NeoVim will use whatever background your
Terminal Emulator is using if you set it to transparent, so background configuration is seperate from
NeoVim.

If you would like to use my background image it is [here](https://github.com/EthanGilles/EthanGilles/blob/61ab3fb7cd0d99a122ceccdffb7ef554871c467b/nvim-pics/background.jpeg)

To change the transparency, find the Catppuccin config and change
```lua
transparent_background = false,
```

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
[Comment](https://github.com/numToStr/Comment.nvim) is used to group together and comment out code. The keymaps for this plugin
are set within the `comment.lua` file because they access the plugin's api. Currently,
commenting out the current line (in normal mode) and commenting out the highlighted lines in visual mode
are both set to <kbd>Ctrl</kbd>+<kbd>/</kbd>.

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
I have modified some of the colors to be brighter so I can clearly see tab levels.
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

The rest of the LuaLine configuration is quite complicated, but it is setup to give lots of
information on the current session, with custom icons. To learn more about customizing LuaLine,
see their [documentation](https://github.com/nvim-lualine/lualine.nvim).

The current LuaLine setup has: Buffers, Mode, CoC Diagnostics, git branch, modifications to the 
file, the time and date, OS, and file-format. I have the buffers in present in the at the top left
where you would normally see tabs in an application, but for this photo, they are along the bottom.

![LuaLine Example](https://github.com/EthanGilles/EthanGilles/blob/bb638cb9f4044e6096218518a17bf07e70578259/nvim-pics/lualine.png)

### Noice
[Noice](https://github.com/folke/noice.nvim) makes things look, well, noice. It centers your command line and makes things look
a lot better in general. I have disabled the notifications that Noice can provide. To enable them,
you need a seperate plugin in the dependencies. However, getting notifications for writing to a file,
executing commands, etc, is not something I was looking for.

![Noice Example](https://github.com/EthanGilles/EthanGilles/blob/ef9def1e4033c1486ca68767641fe83af433b20a/nvim-pics/noice.png)

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

![Telescope Example](https://github.com/EthanGilles/EthanGilles/blob/ef88b8df928210ebffa3a2061edb0bf01e734ac6/nvim-pics/telescope.png)

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

### Highlighted Yank
[Highlighted Yank](https://github.com/machakann/vim-highlightedyank) does exactly what the name states. 
It is a simple quality of life plugin that shows exactly what you just copied to the clipboard. 
It highlights the copied text to show you exactly what was copied. Something I would expect
in any modern IDE.

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


