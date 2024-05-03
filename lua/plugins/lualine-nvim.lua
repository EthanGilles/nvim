local config = function()
  local cyberdream = require("lualine.themes.cyberdream")

  require('lualine').setup {
    options = {
      theme = cyberdream,
      globalstatus = true
    },
  }
end


return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
