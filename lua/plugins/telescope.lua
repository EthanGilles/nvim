local config = function()
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = true,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = true,
      },
      find_buffers = {
        theme = "dropdown",
        previewer = true,
      },
      colorscheme = {
        enable_preview = true,
      }
    },
  })
end


return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim'},
    lazy = true,
    config = config,
    keys = {
    },
}
