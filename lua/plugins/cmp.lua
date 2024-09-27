local config = function()
  local cmp = require("cmp")
  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default
      })
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    experimental = {
      ghost_text = true,
    },
    window = {
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
    }),
    sources = cmp.config.sources({
      { name = "codeium" },
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    } ,
      {
        { name = 'buffer' },
      })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end

return {
  'hrsh7th/nvim-cmp',
  dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'onsails/lspkind.nvim'},
  event = "InsertEnter",
  config = config,
}
