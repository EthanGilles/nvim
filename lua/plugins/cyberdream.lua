local config = function()
  require("cyberdream").setup({
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_picture = true,
      terminal_colors = true,
  })
end

return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 999,
    config = config,
}
