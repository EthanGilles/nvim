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
      lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
        mode = 0, -- mode 0 shows the buffer name
        symbols = {
          modified = ' 󰷫',      -- Text to show when the buffer is modified
          alternate_file = '󰷈 ', -- Text to show to identify the alternate file
          directory =  ' ',     -- Text to show when the buffer is a directory
        },
      }
    },
      lualine_b = {
      {
        'mode',
      }
    },
      lualine_c = {
      {
        'diagnostics',
        sources = {'coc' },
        sections = { 'error', 'warn', 'info', 'hint' },
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        },
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = true, -- Update diagnostics in insert mode.
        always_visible = true,   -- Show diagnostics even if there are none.
      },
      {
        'branch',
        color = { fg = '#cba6f7'},
      },
      {
        'diff',
        colored = true, -- Displays a colored diff status if set to true
        symbols = {added = '󱇬 ', modified = '󱣳 ', removed = '󱘹 '}, -- Changes the symbols used by the diff.
      }
    },
      lualine_x = {
      {
        'filetype',
        icons_enabled = true,
        icon_only = true,
        icon = { align = 'right', },
        color = { fg = '#89dceb',},
      },
    },
      lualine_y = {
      {
        'encoding',
        color = { fg = '#a6e3a1', },
      },
    },
      lualine_z = {
      {
        'datetime',
        style = 'default'
      },
      {
        'fileformat',
        color = { fg = '#fab387', },
      },
    },
  }
}
end


return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
