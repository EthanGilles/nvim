return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.cmd[[syntax enable]]
    vim.cmd[[let g:tex_flavor='latex']]
    vim.cmd[[let g:vimtex_view_method='zathura']]
    vim.cmd[[let g:vimtex_quickfix_mode=0]]
    vim.cmd[[set conceallevel=2]]
    vim.cmd[[let g:tex_conceal='abdmg']]
  end,
}
