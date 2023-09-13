require("awisus.set")
require("awisus.remap")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.clipboard = 'unnamed'
vim.opt.fillchars = { eob = ' ' }
