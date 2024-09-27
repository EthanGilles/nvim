return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
          enable = true,
          priority = 15,
      style = {
          { fg = "#737994" },
          { fg = "#c21f30" },
      },
      use_treesitter = true,
      chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = "─",
      },
      textobject = "",
      max_file_size = 1024 * 1024,
      error_sign = true,
      -- animation related
      duration = 300,
      delay = 120,
      },
      line_num = {
        enable = true,
        style = "#7aa0de",
        priority = 10,
        use_treesitter = false,
      },
    })
  end
}
