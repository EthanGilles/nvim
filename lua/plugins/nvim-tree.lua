local config = function()
  -- disable netrw at the very start of your init.lua
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
  vim.opt.termguicolors = true

  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 25,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = config,
}
