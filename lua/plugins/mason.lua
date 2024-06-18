local config = function()
 require("mason").setup({
    ui = {
        icons = {
            package_installed = "󱝀 ",
            package_pending = "󰦖 ",
            package_uninstalled = " "
        }
    }
})
end


return {
  "williamboman/mason.nvim",
  lazy = false,
  config = config,
}
