return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local bufferline = require("bufferline")
        vim.diagnostic.config { update_in_insert = true }
        bufferline.setup({
            options = {
                mode = "tabs",
                style_preset = bufferline.style_preset.no_italic,
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        separator = true,
                    },
                },
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" }
                },
            },
        })
    end
}
