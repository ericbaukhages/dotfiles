-- nvim settings {{{1
	vim.o.number = true
	vim.o.hlsearch = true
	vim.o.signcolumn = 'yes'
	vim.o.autoindent = true
	vim.o.smartindent = true
	vim.o.expandtab = false
	vim.o.shiftwidth = 2
	vim.o.softtabstop = 2
	vim.o.tabstop = 2
	vim.o.undofile = true
	vim.o.completeopt = 'menuone,noselect'

	vim.cmd('colorscheme eric')

	-- shortcuts {{{2
		-- command mode Emacs-style movement keys, also found in bash/zsh {{{3
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

		-- Diagnostic keymaps {{{3
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
		--}}}
	--}}}
--}}}

-- vim: fdm=marker ts=2 sts=2 sw=2
