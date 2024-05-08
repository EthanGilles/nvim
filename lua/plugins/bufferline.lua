local config = function()
  vim.opt.termguicolors = true
  local bufferline = require('bufferline')
  bufferline.setup {
    options = {
      color_icons = true,
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      seperator_style = "padded_slant",
      hover = {
              enabled = true,
              delay = 200,
              reveal = {'close'}
      },
      diagnostics = "coc",
      diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon .. count
      end,
      offsets = {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
      },
    },
  }
end


return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = config,
}
