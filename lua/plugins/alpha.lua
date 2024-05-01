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
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                               Ethan Gilles                            ]],
			[[                                                                       ]],
		}

		_Gopts = {
			position = "center",
			hl = "Type",
			-- wrap = "overflow";
		}

		-- Set menu
		dashboard.section.buttons.val = {
			-- dashboard.button("SPC j", "󰈚   Restore Session", ":SessionRestore<cr>"),
			dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "   Find file", ":cd $HOME | Telescope find_files<CR>"),
			dashboard.button("g", "󰱼   Find word", ":Telescope live_grep<CR>"),
			dashboard.button("r", "   Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
			dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
			dashboard.button("o", "󱌣   Update LSPs", ":CocUpdate<CR>"),
			dashboard.button("c", "󰋠   Checkhealth", ":checkhealth<CR>"),
			dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
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
  lazy = false,
  event = "VimEnter",
  config = config,
}
