local config = function()
  require('nvim-treesitter.configs').setup({
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "c",
    "cpp",
    "latex",
    "bibtex",
    "rust",
    "html",
    "css",
    "javascript",
    "python",
    "yaml",
    "bash", -- Needed for Noice
    "markdown", -- Needed for Noice
    "lua", -- Needed for Noice
    "markdown_inline", -- Needed for Noice
    "regex", -- Needed for Noice
    "vim", -- Needed for Noice
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
})
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = config,
}
