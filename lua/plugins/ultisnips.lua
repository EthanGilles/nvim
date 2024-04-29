return {
  'SirVer/ultisnips',
  lazy = false,
  init = function()
    vim.cmd[[let g:UltiSnipsSnippetDirectories= [$HOME.'/.config/nvim/UltiSnips',"UltiSnips"] ]]    
  end,
  dependencies = {
    'honza/vim-snippets',
  },
}
