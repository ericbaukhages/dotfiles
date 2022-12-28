-- nvim settings {{{1
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.signcolumn = 'yes'

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.undofile = true

-- shortcuts {{{2
-- command mode Emacs-style movement keys, also found in bash/zsh
vim.keymap.set('c', '<C-a>', '<Home>', {})
vim.keymap.set('c', '<C-b>', '<Left>', {})
vim.keymap.set('c', '<C-f>', '<Right>', {})
vim.keymap.set('c', '<C-d>', '<Delete>', {})
vim.keymap.set('c', '<M-b>', '<S-Left>', {})
vim.keymap.set('c', '<M-f>', '<S-Right>', {})
vim.keymap.set('c', '<M-d>', '<S-right><Delete>', {})
vim.keymap.set('c', '<Esc>b', '<S-Left>', {})
vim.keymap.set('c', '<Esc>f', '<S-Right>', {})
vim.keymap.set('c', '<Esc>d', '<S-right><Delete>', {})
vim.keymap.set('c', '<C-g>', '<C-c>', {})
--}}}
--}}}

-- vim: fdm=marker
