vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFindFileToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "d", [["_d]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("i", "<S-Tab>", "<C-d>")

vim.keymap.set("v", "<leader>\"", "xi\"<Esc>pa\"<Esc>")
vim.keymap.set("v",  "<leader>'", "xi'<Esc>pa'<Esc>")
vim.keymap.set("v",  "<leader>(", "xi(<Esc>pa)<Esc>")
vim.keymap.set("v",  "<leader>[", "xi[<Esc>pa]<Esc>")
vim.keymap.set("v",  "<leader>{", "xi{<Esc>pa}<Esc>")
