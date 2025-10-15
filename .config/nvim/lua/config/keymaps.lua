-- Only use the `<C-a>` command, as `<C-e>` already works as `<End>`
vim.keymap.set('c', '<C-a>', '<Home>', {})

vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc="Open Parent Directory in Oil"})
