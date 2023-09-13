return {
    "vim-test/vim-test",
    config = function ()
        vim.keymap.set("n", "<leader>t", vim.cmd.TestNearest);
        vim.keymap.set("n", "<leader>T", vim.cmd.TestFile);
        vim.keymap.set("n", "<leader>a", vim.cmd.TestSuite);
        vim.keymap.set("n", "<leader>l", vim.cmd.TestLast);
        vim.keymap.set("n", "<leader>v", vim.cmd.TestVisit);
        vim.cmd("let g:test#javascript#runner = 'jest'")
        vim.cmd("let test#strategy = 'neovim'")
    end
}
