return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.cmd[[set conceallevel=2]]
    vim.cmd[[let g:tex_conceal='abdmg']]
  end,
}
