require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 42,
        side = "right",
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
    filters = {
        git_ignored = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})
