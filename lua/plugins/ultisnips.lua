return {
  'SirVer/ultisnips',
  event = "BufReadPre",
  init = function()
    vim.cmd[[let g:UltiSnipsSnippetDirectories= [$HOME.'/.config/nvim/UltiSnips',"UltiSnips"] ]]    
  end,
  dependencies = {
    'honza/vim-snippets',
  },
}
