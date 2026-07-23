-- below is already included in neovim
-- vim.treesitter.start()

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.wo[0][0].foldlevel = 99

vim.bo[0].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
