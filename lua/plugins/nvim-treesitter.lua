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
