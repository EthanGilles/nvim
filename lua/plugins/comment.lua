local config = function ()
  local api = require('Comment.api')
  vim.keymap.set('n', '<C-_>', api.toggle.linewise.current, opts)
  vim.keymap.set('v', '<C-_>', api.toggle.linewise.current, opts)
end

return {
  'numToStr/Comment.nvim',
  opts = {
  },
  lazy = false,
  config = config,
}
