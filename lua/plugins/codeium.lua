return {
    "Exafunction/codeium.nvim",
    lazy = false,
    -- event = "InsertEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
}