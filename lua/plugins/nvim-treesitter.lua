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
    "bash",
    "bibtex",
    "java",
    "rust",
    "html",
    "css",
    "javascript",
    "python",
    "markdown",
    "lua",
    "gitignore",
    "latex",
  },
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "latex", "bibtex" },
    additional_vim_regex_highlighting = true,
  },
})
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = config,
}
