vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = false
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.undofile = true
vim.o.completeopt = 'menuone,noselect'

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.diagnostic.config({ virtual_text = true })

vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2
