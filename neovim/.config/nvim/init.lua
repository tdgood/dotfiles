-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.o.number = true -- line number
vim.o.relativenumber = true -- relative line numbers
vim.o.cursorline = true -- highlight current line
vim.o.wrap = false -- do not wrap lines by default
vim.o.scrolloff = 7 -- keep 7 lines above/below cursor
vim.o.sidescrolloff = 7 -- keep 7 lines to left/right of cursor
vim.o.tabstop = 4 -- tabwidth
vim.o.shiftwidth = 4 -- indent width
vim.o.softtabstop = 4 -- soft tab stop not tabs on tab/backspace
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.smartindent = true -- smart auto-indent
vim.o.autoindent = true -- copy indent from current line
vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true -- case sensitive if uppercase in string
vim.o.hlsearch = true -- highlight search matches
vim.o.incsearch = true -- show matches as you type
vim.o.timeoutlen = 500 -- keymap timeout duration
vim.o.signcolumn = "yes" -- always show a sign column
-- vim.o.colorcolumn = "80" -- show a column at 80 position chars
vim.o.completeopt = "menuone,noselect,popup" -- completion options
vim.o.showmode = false -- do not show the mode, instead have it in statusline
vim.o.pumheight = 10 -- popup menu height
vim.o.synmaxcol = 300 -- syntax highlighting limit
vim.o.fillchars = "eob: " -- hide "~" on empty lines
vim.o.backup = false -- do not create a backup file
vim.o.writebackup = false -- do not write to a backup file
vim.o.swapfile = false -- do not create a swapfile
vim.o.undofile = true -- do create an undo file

local undodir = vim.fn.expand("$HOME/.local/state/nvim/undodir")
if not vim.fn.isdirectory(undodir) then
    vim.fn.mkdir(undodir, "p") -- create undodir if nonexistent
end

vim.o.undodir = undodir -- set the undo directory
vim.o.autoread = true -- auto-reload changes if outside of neovim
vim.o.autowrite = false -- do not auto-save
vim.o.confirm = true -- show dialog for unsaved files before quit
vim.o.termguicolors = true -- enable 24-bit rgb colors
vim.o.clipboard = "unnamedplus" -- use system clipboard
vim.o.mouse = "a" -- enable mouse support
vim.o.iskeyword = vim.o.iskeyword .. ",-" -- include - in words
vim.o.path = vim.o.path .. ",**" -- include subdirs in search
vim.o.splitbelow = true -- horizontal splits go below
vim.o.splitright = true -- vertical splits go right
vim.o.wildmenu = true -- command line tab completion
vim.o.wildmode = "longest:full,full" -- complete longest common match, display completion list

vim.g.c_syntax_for_h = true -- treat .h files as c instead of cpp (for treesitter)
vim.g.loaded_perl_provider = 0 -- disable perl warning in :checkhealth
vim.g.loaded_python3_provider = 0 -- disable python warning in :checkhealth
vim.g.loaded_node_provider = 0 -- disable node warning in :checkhealth
vim.g.loaded_ruby_provider = 0 -- disable ruby warning in :checkhealth

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

vim.keymap.set("n", "j", "gj", { desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", "gk", { desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlights", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("n", "<leader>bl", ":ls<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd<CR>:e#<CR>:bd#<CR>", { desc = "Delete all other buffers", silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<leader>te", ":tabe<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tc", ":tabc<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>to", ":tabo<CR>", { desc = "Close all other tabs" })
vim.keymap.set("n", "<leader>tn", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", "gT", { desc = "Previous tab" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

vim.keymap.set({ "n", "v" }, "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set({ "n", "v" }, ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>ex", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit neovim config" })

vim.keymap.set(
    "n",
    "<leader>pc",
    ":lua vim.pack.update(nil, { offline = true })<CR>",
    { desc = "Package check (list installed packages)" }
)
vim.keymap.set("n", "<leader>pu", ":lua vim.pack.update()<CR>", { desc = "Package update" })

-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================
vim.diagnostic.config({
    update_in_insert = false,
    severity_sort = true,
    underline = { severity = { min = vim.diagnostic.severity.WARN } },
    virtual_text = true,
})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "<leader>nd", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>pd", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

-- ============================================================================
-- AUTOCMDS
-- ============================================================================
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.hl.on_yank()
    end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    desc = "Restore last cursor position",
    callback = function()
        local last_pos = vim.api.nvim_buf_get_mark(0, "\"")
        local last_line = vim.api.nvim_buf_line_count(0)

        local row = last_pos[1]
        if row < 1 or row > last_line then
            return
        end

        pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
    end,
})

-- LSP setup
vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup,
    desc = "LSP actions",
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        client.server_capabilities.semanticTokensProvider = nil

        -- Enable native completion
        -- if client:supports_method("textDocument/completion") then
        --     local chars = {}
        --     for i = 32, 126 do
        --         table.insert(chars, string.char(i))
        --     end
        --
        --     client.server_capabilities.completionProvider.triggerCharacters = chars
        --
        --     vim.lsp.completion.enable(true, client.id, ev.buf, {
        --         autotrigger = true,
        --         convert = function(item)
        --             return { abbr = item.label:gsub("%b()", "") }
        --         end
        --     })
        -- end

        -- Enable mini.completion completion
        if client:supports_method("textDocument/completion") then
            vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
            vim.bo[ev.buf].completeopt = "menuone,noselect"
        end

        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buf = ev.buf })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition", buf = ev.buf })
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buf = ev.buf })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references", buf = ev.buf })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", buf = ev.buf })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buf = ev.buf })

        -- Native LSP format
        -- vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format document", buf = ev.buf })

        -- Conform plugin format
        vim.keymap.set({ "n", "v" }, "<leader>fm", function()
            require("conform").format({ bufnr = ev.buf, lsp_format = "fallback" })
        end, { desc = "Format document", buf = ev.buf })

        vim.keymap.set("n", "<leader>h", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle inlay hints", buf = ev.buf })
    end,
})

-- ============================================================================
-- PLUGINS
-- ============================================================================
vim.pack.add({
    { src = "https://www.github.com/catppuccin/nvim", name = "catppuccin" },
    "https://www.github.com/neovim/nvim-lspconfig",
    "https://www.github.com/mason-org/mason.nvim",
    "https://www.github.com/mason-org/mason-lspconfig.nvim",
    "https://www.github.com/stevearc/conform.nvim",
    "https://www.github.com/nvim-mini/mini.nvim",
})

-- ============================================================================
-- PLUGIN CONFIGURATION
-- ============================================================================
require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        mini = { enabled = true },
    },
})
vim.cmd.colorscheme("catppuccin-nvim")

require("mason").setup()
require("mason-lspconfig").setup()
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },
})
require("mini.completion").setup({
    lsp_completion = {
        source_func = "omnifunc",
        auto_setup = false,
    },
})

require("mini.extra").setup()
require("mini.pick").setup()
vim.keymap.set("n", "<leader><space>", ":Pick buffers<CR>", { desc = "Show open buffers" })
vim.keymap.set("n", "<leader>fs", ":Pick buf_lines<CR>", { desc = "Find in all buffers" })
vim.keymap.set("n", "<leader>fb", ":Pick buf_lines scope=\"current\"<CR>", { desc = "Find in current buffer" })
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Live grep in project" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find in help menu" })

require("mini.keymap").map_multistep({ "i", "s" }, "<Tab>", { "vimsnippet_next", "pmenu_next" })
require("mini.keymap").map_multistep({ "i", "s" }, "<S-Tab>", { "vimsnippet_prev", "pmenu_prev" })
require("mini.keymap").map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
require("mini.keymap").map_multistep("i", "<BS>", { "minipairs_bs" })

require("mini.notify").setup({
    lsp_progress = { enable = false },
})

require("mini.pairs").setup()
require("mini.ai").setup()
require("mini.surround").setup()

require("mini.indentscope").setup()
require("mini.cursorword").setup()

require("mini.icons").setup()
require("mini.statusline").setup()
