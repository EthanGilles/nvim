return {
  "quangnguyen30192/cmp-nvim-ultisnips",
  event = "InsertEnter",
  config = function()
      require("cmp_nvim_ultisnips").setup{}
  end,
}
