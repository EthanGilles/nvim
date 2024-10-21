local config = function()
  local on_attach = function(_, _)
    local keyset = vim.keymap.set
    keyset('n', '<leader>rn', vim.lsp.buf.rename, {}) -- rename
    keyset('n', '<leader>ca', vim.lsp.buf.code_action, {}) -- code action

    keyset('n', 'gd', vim.lsp.buf.definition, {}) -- global definition
    keyset('n', 'gi', vim.lsp.buf.implementation, {}) -- global implementation
    keyset('n', 'gr', require('telescope.builtin').lsp_references, {}) -- global references 
    keyset('n', 'K', vim.lsp.buf.hover, {}) -- global implementation
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- Setup all of the LSPs
  require("lspconfig").lua_ls.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").rust_analyzer.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").clangd.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").texlab.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").marksman.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").jedi_language_server.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").html.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").cssls.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").ts_ls.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").bashls.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").hls.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").tailwindcss.setup{ on_attach = on_attach, capabilities = capabilities, }
  require("lspconfig").asm_lsp.setup{ on_attach = on_attach, capabilities = capabilities, }
end

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = config,
}
