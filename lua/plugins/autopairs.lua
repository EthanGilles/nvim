local config = function ()
  require("nvim-autopairs").setup{}
  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')

  local cond = require('nvim-autopairs.conds')

  -- Adds '$' pairing in '.tex' files.
  npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
  :with_pair(cond.not_after_regex("%%"))
  :with_pair(cond.not_after_regex("$$"))
  :with_pair(cond.not_before_regex("$$"))
  -- If you hit '$' when there is one to the right, it will move cursor instead of typing a '$'
  :with_move(cond.after_regex("$"))
  })

  -- Copied from auto-pairs README. Should add '$' pairing
  npairs.add_rules({
  Rule("$$","$$","tex")
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
          return false
        end
    end)
   })
end

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = config,
}
