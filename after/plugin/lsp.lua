require('mason.settings').set({
    ui = {
        border = 'rounded'
    }
})

local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")
lsp_zero.ensure_installed({
    'tsserver',
    'eslint',
})
lsp_zero.nvim_workspace()

local cmp = require('cmp')
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ["<Enter>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp_zero.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- see :help lsp-zero-keybindings
-- to learn the available actions
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ "n", "i" }, "<C-b>", function() vim.lsp.buf.inlay_hint(0, nil) end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
end

lsp_zero.on_attach(on_attach)
lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})
lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- (Optional) Configure lua language server for neovim
local lsp_config = require('lspconfig')
lsp_config.lua_ls.setup(lsp_zero.nvim_lua_ls())
lsp_config.dartls.setup({
    on_attach = on_attach,
    settings = {
        dart = {
            analysisExcludedFolders = {
                vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
                vim.fn.expand("$HOME/.pub-cache"),
                vim.fn.expand("/opt/homebrew/"),
                vim.fn.expand("$HOME/flutter/"),
            },
            updateImportsOnRename = true,
            completeFunctionCalls = true,
            showTodos = true,
        },
    },
})
lsp_config.kotlin_language_server.setup({
    on_attach = on_attach,
})
