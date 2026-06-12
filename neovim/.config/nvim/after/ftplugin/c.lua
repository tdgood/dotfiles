-- c doesn't use treesitter highlight by default (see https://github.com/neovim/neovim/pull/32965)
-- turn on treesitter manually
vim.treesitter.start()

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.wo[0][0].foldlevel = 99
