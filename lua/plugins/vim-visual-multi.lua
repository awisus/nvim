return {
    "mg979/vim-visual-multi",
    branch = "master",
    name = "vim-visual-multi",
    lazy = false,
    init = function()
       vim.g.VM_maps = {
           ["Add Cursor Down"] = '<C-j>',
           ["Add Cursor Up"] = '<C-k>',
       }
    end
}
