vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>:lclose<CR>:pclose<CR>",
    { desc = "Close info buffers when selecting an option", buf = 0, silent = true })
