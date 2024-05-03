local config = function()
  require ('colorizer').setup {
    filetypes = {
      '*'; -- Highlight all files, but customize some others.
    },
  }
end

return {
  'NvChad/nvim-colorizer.lua',
  lazy = false,
  config = config,
}
