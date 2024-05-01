# NEOVIM CONFIG

------------------

<img src="https://github.com/EthanGilles/nvim/blob/f713dc8d368f7091503ebd86c037e73c6132b973/pictures/demo.gif">

<h2>Colorscheme</h2>

Currently I am running the 'Catppuccin' theme. I have it installed for 
my terminal (Windows Terminal), NeoVim, and Zathura (PDF viewer).

<h2>Plugin Manager</h2>

Currently I am using the Lazy plugin manager.

<h2>Font</h2>

Currently I am using JetBrainsMonoNL Nerd Font Mono

<h2>Plugins</h2>
<ul>
    <li>catppuccin.nvim</li>
    <li>coc.nvim (Conquer of Completion)</li>
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

<h2>Info</h2>

<h3>Conquer of Completion</h3>
CoC is used to for auto completion. It has compatability with UltiSnips so you can get 
snippets and reccomendations from the language server you choose to download. It also provides
other auto complete functionality.

Within COC you have to install 'CoC extensions' to get functionality.
I have the following language servers/COC extensions installed
<ul>
    <li>coc-vimtex  (VimTex support for CoC)</li>
    <li>coc-snippets (Snippets included in CoC)</li>
    <li>coc-pairs (Auto-pairing for parenthesis, quotes, brackets, etc.)</li>
    <li>coc-texlab (LaTeX lsp for auto complete)</li>
    <li>coc-rust-analyzer (Rust lsp for auto complete)</li>
    <li>coc-clangd (C/C++ lsp for auto complete)</li>
</ul>

You can install them by using the command ':CocInstall [list-item]'

<h3>Comment</h3>
Comment.nvim is used to group together and comment out code. In my configuration, you use
visual mode to highlight the words you want commented out and then press `Shift + /`

<h3>Indent-blankline</h3>
indent-blankline will help with auto indenting the next line, and will give you different colors
along the lefthand side of the editor for separate indenting levels. The colors can be customized
in its lua file.

<h3>LuaLine</h3>
LuaLine helps by giving you information on your NeoVim session. It gives information like the
filetype, your git status, the files you have edited, OS, and more. Super easy to customize and
most NeoVim 'themes' come with a LuaLine theme as well. I use 'cyberdream' for my LuaLine theme,
I like it quite a bit more than the catppuccin theme

<h3>Noice</h3>
Noice makes things look, well, noice. It gives centers your command line and makes things look
a lot better in general. It also integrates with telescope to make everything look great.

<h3>Nvim-tree</h3>
Nvim-tree gives you a file explorer on the left side of the screen. With web-dev-icons the file
explorer will also display icon types for each type of file, as well as git status. With my
configuration I have `<leader> + f` mapped to close the tree, and `<leader> m` to move the cursor
to the tree.

<h3>Nvim-treesitter</h3>
Nvim-treesitter gives better syntax highlighting for languages. It parses the language using a 
language tree to give much better syntax highlighting than without it. All of the languages I use
are listed in `ensure_install` in the lua file. 'tree-sitter-cli' is required for tree-sitter to
parse and highlight LaTeX documents. I used cargo to install the package and it works great.

<h3>Telescope</h3>
Telescope is the ultimate fuzzy finder for NeoVim. It integrates with noice to give you a fuzzy 
finder with a file previewer right in NeoVim. It also has a live-grep feature with a file previewer
as well. It uses ripgrep as a dependency which can be installed with `apt get`. With my configuration
I use `<leader>ff` to fuzzy-find files, and `<leader>fg` to live-grep through files.

<h3>UltiSnips</h3>

I am using UltiSnips for snippet completion.
To add a snippet, type ':UltiSnipsEdit' within the filetype that you want to add a snippet for.
Some of the snippets I am using for LaTeX can be found <a href='https://castel.dev/post/lecture-notes-1/'>here</a>

<h3>Highlighted Yank</h3>
This plugin does exactly what the name states. I like having the text highlighted after I 'copy' 
or yank it. So it highlights the copied text to show you exactly what was copied to the clipboard.

<h3>Illuminate</h3>
Illuminate is another aesthetic plugin that will highlight all occurrances of the same word that
your cursor is currently on. It is especially useful for variable names or object types.

<h3>VimTex</h3>
VimTex is the perfect plugin for anyone wanting to edit LaTeX files in NeoVim. It allows for
continuous compiling of a '.tex' document. In my configuration, `<leader>ll` starts the continuous
compiler and viewer. For a PDF viewer, I use Zathura, which can be installed with `apt get`. 
When compiling, the LaTeX compiler creates some junk files that can be cleaned up with `<leader>lc` as well.

<h2>More Screenshots</h2>

A C++ file with this config:
<img src="https://github.com/EthanGilles/nvim/blob/36bc6266a08a117f7190891209028ad966350c63/pictures/cpp.png">

A Rust file with this config:
<img src="https://github.com/EthanGilles/nvim/blob/36bc6266a08a117f7190891209028ad966350c63/pictures/rust.png">

A LaTeX file with this config, using Zathura PDF viewer:
<img src="https://github.com/EthanGilles/nvim/blob/36bc6266a08a117f7190891209028ad966350c63/pictures/latex.png">

