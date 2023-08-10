-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- command mode Emacs-style movement keys, also found in bash/zsh {{{
vim.keymap.set("c", "<C-a>", "<Home>", {})
vim.keymap.set("c", "<C-b>", "<Left>", {})
vim.keymap.set("c", "<C-f>", "<Right>", {})
vim.keymap.set("c", "<C-d>", "<Delete>", {})
vim.keymap.set("c", "<M-b>", "<S-Left>", {})
vim.keymap.set("c", "<M-f>", "<S-Right>", {})
vim.keymap.set("c", "<M-d>", "<S-right><Delete>", {})
vim.keymap.set("c", "<Esc>b", "<S-Left>", {})
vim.keymap.set("c", "<Esc>f", "<S-Right>", {})
vim.keymap.set("c", "<Esc>d", "<S-right><Delete>", {})
vim.keymap.set("c", "<C-g>", "<C-c>", {})
--}}}
