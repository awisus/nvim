return {
    "nickjvandyke/opencode.nvim",
    opts = {
        auto_fallback_to_embedded = false,
    },
    keys = {
        {
            "<leader>oa",
            function()
                local opencode_exists = false
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    local name = vim.api.nvim_buf_get_name(buf)
                    if name:match("opencode") then
                        opencode_exists = true
                        break
                    end
                end

                if not opencode_exists then
                    vim.notify("opencode session not found", vim.log.levels.WARN)
                    return
                end

                require("opencode").ask("@this: ", { submit = true })
            end,
            mode = { "n", "x" },
            desc = "Ask opencode…"
        },
    },
    config = function()
        vim.g.opencode_opts = {
            -- Your configuration, if any; goto definition on the type or field for details
        }
    end,
}
