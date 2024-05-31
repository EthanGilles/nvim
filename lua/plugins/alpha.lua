local config = function()
  local alpha = require('alpha')
  local dashboard = require('alpha.themes.dashboard')

  dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ ████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                               Ethan Gilles                            ]],
			[[                                                                       ]],
		}

		_Gopts = {
			position = "center",
			hl = "Type",
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "󰥨   Find Files", ":cd $HOME | Telescope find_files<CR>"),
			dashboard.button("g", "󰱼   Find Words", ":cd $HOME | Telescope live_grep<CR>"),
			dashboard.button("r", "󰤘   Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
			dashboard.button("m", "󰢛   Mason", ":Mason<CR>"),
			dashboard.button("u", "   Update Plugins", "<cmd>lua require('lazy').sync()<CR>"),
			dashboard.button("s", "󱌣   Update LSPs", ":MasonUpdate<CR>"),
			dashboard.button("p", "   Update Parsers", ":TSUpdate all<CR>"),
			dashboard.button("h", "󰋠   Check Health", ":checkhealth<CR>"),
			dashboard.button("q", "   Quit NeoVim", ":qa<CR>"),
		}

    local function footer()
      local total_plugins = #require('lazy').plugins()
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

      return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
    end

    dashboard.section.footer.val = footer()
		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)

		require("alpha").setup(dashboard.opts)
end

return {
  'goolord/alpha-nvim',
  event = "VimEnter",
  config = config,
}
