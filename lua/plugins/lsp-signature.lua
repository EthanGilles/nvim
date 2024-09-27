return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "double"
    },
    floating_window_off_y = -1,
    hint_enable = false,
  },
  config = function(_, opts) require'lsp_signature'.setup(opts) end
}
