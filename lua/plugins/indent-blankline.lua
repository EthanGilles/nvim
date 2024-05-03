local config = function()
  local highlight = {
    "RainbowRed",
    "RainbowBlue",
    "RainbowYellow",
    "RainbowViolet",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF79C6" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#8BE9FD" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#BD93F9" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

 require("ibl").setup { indent = { highlight = highlight } }
end

return { 
  "lukas-reineke/indent-blankline.nvim", 
  main = "ibl", 
  opts = {},
  config = config,
  lazy = false,
}

