local options = {
  disabled_filetypes = {"NvimTree", "lazy", "mason", "help", "checkhealth", "lspinfo", "noice", "Trouble", "fish", "zsh", "alpha"}
}

return {
  "m4xshen/smartcolumn.nvim",
  opts = options,
  lazy = false,
}
