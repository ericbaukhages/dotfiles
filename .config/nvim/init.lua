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

--vim.opt.termguicolors = true
vim.cmd('colorscheme eric')

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

-- plugins {{{1
-- install packer {{{2
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
	print('Done.')

	vim.cmd('packadd packer.nvim')
	install_plugins = true
end
-- Run this to check where plugins are installed
-- `:echo stdpath('data') . '/site/pack/packer'

--}}}

-- packer plugins {{{2
require('packer').startup(function(use)

	-- package manager
	use 'wbthomason/packer.nvim'

	-- old visual plugins
	use 'itchyny/lightline.vim'
	use 'mhinz/vim-signify'

	-- chrome refresh plugin
	use 'ericbaukhages/vim-refresh'

	-- tpope plugins!
	use 'tpope/vim-abolish'
	use 'tpope/vim-commentary'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-repeat'
	use 'tpope/vim-sleuth'
	use 'tpope/vim-surround'
	use 'tpope/vim-vinegar'

	if install_plugins then
		require('packer').sync()
	end
end)
--}}}

-- don't continue if installing plugins for the first time
if install_plugins then
	return
end

--}}}

-- Plugin settings {{{1
-- APZelos/blamer.nvim {{{2
vim.cmd [[
	let g:blamer_enabled = 1
	let g:blamer_delay = 200
	let g:blamer_date_format = '%Y-%m-%d %H:%M'
	let g:blamer_show_in_visual_modes = 0
]]
--}}}2
--}}}

-- vim: fdm=marker
