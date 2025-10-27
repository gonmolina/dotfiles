-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Always visually wrap lines that exceed the screen width
-- Set text width for manual formatting commands like `gq`
vim.opt.textwidth = 150
vim.opt.wrap = true
vim.opt.linebreak = true
-- vim.opt.columns = 152
vim.opt.colorcolumn = "151"

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.ts = 2
vim.o.sts = 2
vim.o.sw = 2
vim.o.et = true

--- Set conceal level in order to make obsidian works
vim.wo.conceallevel = 1

-- vim: ts=2 sts=2 sw=2 et
