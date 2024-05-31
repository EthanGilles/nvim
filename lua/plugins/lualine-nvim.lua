local config = function()
  local cyberdream = require("lualine.themes.cyberdream")


  require('lualine').setup {
    options = {
      theme = cyberdream,
      globalstatus = true,
      section_separators = { left = ' ⟩ ', right = ' ⟨ ' },
      component_separators = { left = ' ⟩ ', right = ' ⟨ ' },
    },
    extensions = {'mason', 'lazy', },
    sections = {
      lualine_a = {
      {
        'mode',
        fmt = function(str) return str:sub(1,1) end,
      }
    },
      lualine_b = {
      {
        'location',
        color = { fg = '#eba0ac' },
      }
    },
      lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_lsp'},
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
      },
      {
        function()
          return require('lsp-progress').progress()
        end,
        color = { fg = '#89b4fa'}
      },
    },
      lualine_x = {
      { require('auto-session.lib').current_session_name },
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
    },
    tabline = {
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
  },
}

  vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
  })
end

return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
