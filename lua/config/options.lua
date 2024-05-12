local opt = vim.opt

-- Tab / Indentation Options --
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search Items --
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Apearance --
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '100'
opt.signcolumn = 'yes'
opt.cmdheight = 0
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behavior --
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.cmdheight = 2
opt.iskeyword:append("-")
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

-- Commands --
-- Disables Ruby and Perl as they're not needed for the configuration.
vim.cmd[[let g:loaded_ruby_provider = 0]]
vim.cmd[[let g:loaded_perl_provider = 0]]
