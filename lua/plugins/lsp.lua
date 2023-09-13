return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
        })

        local lsp_zero = require("lsp-zero")
        local lsp_attach = function(_, bufnr)
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
            vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
            vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
        end
        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "",
            info = ""
        })
        lsp_zero.setup()

        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<Enter>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            formatting = lsp_zero.cmp_format({ details = true }),
        })

        require("mason").setup()
        require("mason.settings").set({
            ui = {
                border = "rounded"
            }
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
            handlers = {
                function(server_name)
                    vim.lsp.config(server_name, {})
                    vim.lsp.enable({server_name})
                end,
            }
        })

        vim.lsp.config("lua_ls", lsp_zero.nvim_lua_ls())
        vim.lsp.enable({"lua_ls"})
        vim.lsp.config("dartls", {
            on_attach = lsp_attach,
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
        vim.lsp.enable({"dartls"})
    end
}
