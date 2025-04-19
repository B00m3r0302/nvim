return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "night", -- Choose between "storm", "moon", "night", or "day"
                transparent = false,
                terminal_colors = true,
            })
        end,
    },
}
