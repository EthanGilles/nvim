local config = function()
  -- Alwyas update the color values in cmp_docs even if it not focused
  require ('colorizer').setup {
    filetypes = {
      '*'; -- Highlight all files, but customize some others.
      cmp_docs = {always_update = true}
    },
  }
end

return {
  'NvChad/nvim-colorizer.lua',
  lazy = false,
  config = config,
}
