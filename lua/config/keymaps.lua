local keymap = vim.keymap
local opts = { noremap = true, silent = true } 

-- Directory Navigation --
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation --
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Left 
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Right

-- Window Management -- 
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertical
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontal

-- Indenting --
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments --
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- VimTex Command --
-- <SPACE+L+C> (Latex Clean) cleans the directory with latex files after compiling.
keymap.set("n","<leader>lc", ":VimtexClean<CR>", {noremap = true})

-- Auto Completion --

local keyset = vim.keymap.set

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Press <TAB> to cycle down, <Shift+TAB> for cycle up, and <ENTER> for confirming.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
