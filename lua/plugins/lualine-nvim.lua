local config = function()
  -- local theme = require('lualine.themes.nightfox')
  -- theme.normal.c.bg = nil
  
  local cyberdream = require("lualine.themes.cyberdream")
  -- local catppuccin = require('lualine.themes.catppuccin')
  require('lualine').setup {
    options = {
      theme = 'cyberdream',
      -- theme = 'catppuccin',
      -- theme = theme,
      globalstatus = true
    },
    sections = {
      lualine_a = {
        {
          'buffers',
        }
      },
    },
  }
end


return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
