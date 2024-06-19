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

	-- Only use the `<C-a>` command, as `<C-e>` already works as `<End>`
	vim.keymap.set('c', '<C-a>', '<Home>', {})
--}}}

-- plugins {{{1
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end

	vim.opt.rtp:prepend(lazypath)

	-- load plugin list from ~/.config/nvim/lua/plugins/init.lua
	require("lazy").setup("plugins");
--{{{

-- vim: fdm=marker ts=2 sts=2 sw=2
