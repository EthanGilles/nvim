local config = function()
  require("auto-session").setup {
    log_level = "error",
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/pictures", },
    auto_session_use_git_branch = false,
    auto_session_enable_last_session = false,

    session_lens = {
      buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
      load_on_setup = true,
      theme_conf = { border = true },
      previewer = false, -- Doesn't really give a good preview of the session. 
    },

  }
end
return {
  'rmagatti/auto-session',
  lazy = true,
  config = config,
}
