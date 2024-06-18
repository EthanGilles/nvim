local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set Cursor to the middle of the screen --
keymap.set('n', '<leader>to', function() vim.opt.scrolloff = 999 - vim.o.scrolloff end, opts)

-- Enable Spell Check --
keymap.set('n', '<leader>sc', ':setlocal spell spelllang=en_us<CR>', opts)

-- Clear the current search word
keymap.set("n", "<C-c>", ":nohl<CR>", opts)

-- Directory Navigation --
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts) -- Jump to tree
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts) -- Toggle tree

-- Pane Navigation --
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Left 
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Right

-- Window Management -- 
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertical
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontal

-- Buffer Management --
keymap.set("n", "<leader>n", ":bn<CR>", opts) -- Next Buffer 
keymap.set("n", "<leader>p", ":bp<CR>", opts) -- Previous Buffer 
keymap.set("n", "<leader>d", ":bd<CR>", opts) -- Close current buffer 
keymap.set("n", "<leader>o", ":enew<CR>", opts) -- Create a new empty buffer 

-- Code folding --
keymap.set("n", "<leader>fi", ":set foldmethod=indent<CR>") -- FOLD INDENT

-- Indenting --
keymap.set("v", "<", "<gv") -- Move left an indent
keymap.set("v", ">", ">gv") -- Move right an indent

-- Telescope --
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>") -- Find key
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>") -- Find help
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- Find files
keymap.set("n", "<leader>fa", ":Telescope <CR>") -- Find all
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- Find grep
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>") -- Find byffers 
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>") -- Find recent

-- Session Management --
keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>") -- Save Session
keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>") -- Restore Session
keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, opts)

-- Line Numbers --
keymap.set("n", "<leader>hn", ":set norelativenumber nonumber<CR>") -- Hide Numbers
keymap.set("n", "<leader>sn", ":set number relativenumber<CR>") -- Show Numbers

-- VimTex Command --
-- <SPACE+L+C> (Latex Clean) cleans the directory with latex files after compiling.
keymap.set("n","<leader>lc", ":VimtexClean<CR>", {noremap = true})
