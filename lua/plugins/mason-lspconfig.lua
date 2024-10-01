local config = function()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls", -- Lua
      "rust_analyzer", -- Rust
      "clangd", -- C/C++
      "texlab", -- LaTeX
      "marksman", -- Markdown
      "jedi_language_server", -- Python
      "html", -- HTML
      "cssls",
      "ts_ls", -- JS/TypeScript
      "bashls", -- Bash

      -- ONLY INCLUDE THIS if you have GHCup to install hls.
      -- "hls", -- Haskell 
    },
  })
end

return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  config = config,
}
