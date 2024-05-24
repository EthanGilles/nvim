local config = function ()
  local api = require('Comment.api')
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

  -- Toggle current line
  vim.keymap.set('n', '<C-_>', api.toggle.linewise.current, opts)

  -- Toggle highlighted selection (linewise)
  vim.keymap.set('x', '<C-_>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
end

return {
  'numToStr/Comment.nvim',
  opts = {
  },
  lazy = false,
  config = config,
}
