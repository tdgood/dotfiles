vim.keymap.set("n", "q", ":cclose<CR>:lclose<CR>:pclose<CR>", { desc = "Close info buffer", buf = 0, silent = true })
vim.keymap.set(
    "n",
    "<CR>",
    "<CR>:cclose<CR>:lclose<CR>:pclose<CR>",
    { desc = "Select option and close info buffer", buf = 0, silent = true }
)
