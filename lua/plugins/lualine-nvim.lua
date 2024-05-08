local config = function()
  local cyberdream = require("lualine.themes.cyberdream")

  require('lualine').setup {
    options = {
      theme = cyberdream,
      globalstatus = true,
      section_separators = { left = ' | ', right = ' | ' },
      component_separators = { left = ' | ', right = ' | ' },
    },
    sections = {
      lualine_b = {
      {
        'buffers',
        show_filename_only = true,   -- Shows shortened relative path when set to false.
        hide_filename_extension = false,   -- Hide filename extension when set to true.
        show_modified_status = true, -- Shows indicator when the buffer is modified.
        mode = 0, -- 0: Shows buffer name
        symbols = {
          modified = ' ●',      -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },
      }
    },
      lualine_c = {
      {
        'diagnostics',
        sources = {'coc' },
        -- Displays diagnostics for the defined severity types
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        },
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = true,   -- Show diagnostics even if there are none.

      },
      {
        'branch',
      },
      {
        'diff',
        colored = true, -- Displays a colored diff status if set to true
        symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
      }
    },
      lualine_y = {},
      lualine_z = {
      {
        'datetime',
        style = 'default'
      }
    },
  }
}
end


return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
