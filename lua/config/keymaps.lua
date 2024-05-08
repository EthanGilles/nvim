local keymap = vim.keymap
local opts = { noremap = true, silent = true }

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

-- Comments --
keymap.set("n", "<C-_>", "gcc", { noremap = false })
keymap.set("v", "<C-_>", "gcc", { noremap = false })

-- Telescope --
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>") -- Find key
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>") -- Find help
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- Find files
keymap.set("n", "<leader>fa", ":Telescope <CR>") -- Find all
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- Find grep
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>") -- Find recent

-- VimTex Command --
-- <SPACE+L+C> (Latex Clean) cleans the directory with latex files after compiling.
keymap.set("n","<leader>lc", ":VimtexClean<CR>", {noremap = true})

-- Auto Completion --
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Press <TAB> to cycle down, <Shift+TAB> for cycle up, and <ENTER> for confirming.
opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <ENTER> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
