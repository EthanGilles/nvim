local config = function()
  require("auto-session").setup {
    auto_restore = false,
    auto_restore_last_session = false,
    git_use_branch_name = false,
    log_level = "error",
    session_lens = {
      buftypes_to_ignore = {},
      load_on_setup = true,
      previewer = false,
      theme_conf = {
        border = true
      }
    },
    suppressed_dirs = { "~/", "~/pictures" }
  }
end
return {
  'rmagatti/auto-session',
  lazy = false,
  config = config,
}
