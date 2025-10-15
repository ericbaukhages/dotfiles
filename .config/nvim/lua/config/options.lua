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

-- Only use the `<C-a>` command, as `<C-e>` already works as `<End>`
vim.keymap.set('c', '<C-a>', '<Home>', {})

-- vim.diagnostic.config({ virtual_text = true })
