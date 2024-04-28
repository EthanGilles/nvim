return {
  'SirVer/ultisnips',
  lazy = false,
  init = function()
    vim.cmd[[let g:UltiSnipsSnippetDirectories= [$HOME.'/.config/nvim/UltiSnips',"UltiSnips"] ]]    
    vim.cmd[[let g:UltiSnipsExpandTrigger="<tab>"]]
    vim.cmd[[let g:UltiSnipsJumpForwardTrigger="<c-b>"]]
    vim.cmd[[let g:UltiSnipsJumpBackwardTrigger="<c-z>"]]
  end,
  dependencies = {
    'honza/vim-snippets',
  },
}
