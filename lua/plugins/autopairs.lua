local config = function ()
  require("nvim-autopairs").setup{}
  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')
  npairs.add_rule(Rule("$$","$$","tex"))

  local cond = require('nvim-autopairs.conds')

  npairs.add_rule(Rule("$$","$$","tex"))

  npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
  :with_pair(cond.not_after_regex("%%"))
  :with_pair(cond.not_after_regex("$$"))
  :with_pair(cond.not_before_regex("$$"))
  :with_move(cond.after_regex("$"))
  })

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
