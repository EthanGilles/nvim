return {
  "RRethy/vim-illuminate",
  event = "BufReadPre",
  config = function()
    require('illuminate').configure({})
  end
}
