return {
  "roobert/action-hints.nvim",
  config = function()
    require("action-hints").setup({
      template = {
        definition = { text = " ⊛", color = "#82d2e0" },
        references = { text = " ↱%s", color = "#f6b596" },
      },
      use_virtual_text = true,
    })
  end,
}
