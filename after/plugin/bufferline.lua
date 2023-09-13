local bufferline = require('bufferline')
bufferline.setup({
    options = {
        mode = "tabs",
        style_preset = bufferline.style_preset.no_italic,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
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
            reveal = { 'close' }
        },
    },
})
