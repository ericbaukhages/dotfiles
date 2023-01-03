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

vim.cmd('colorscheme eric')

vim.o.completeopt = 'menuone,noselect'

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

	-- chrome refresh plugin
	use 'ericbaukhages/vim-refresh'

	-- tpope plugins! {{{3
	use 'tpope/vim-abolish'
	use 'tpope/vim-commentary'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-repeat'
	use 'tpope/vim-sleuth'
	use 'tpope/vim-surround'
	use 'tpope/vim-vinegar'
	---}}}

	--- lsp {{{3
	use {
		'neovim/nvim-lspconfig',
		requires = {
			-- Automatically  install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration
			'folke/neodev.nvim',
		}
	}
	---}}}

	-- autocompletion {{{3
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		}
	}
	--}}}

	-- treesitter {{{3
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update({ with_sync = true }))
		end
	}
	--}}}

	use 'nvim-lualine/lualine.nvim'
	use 'lewis6991/gitsigns.nvim'

	-- telescope {{{3
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
		cond = vim.fn.executable('make') == 1
	}
	--}}}

	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	if install_plugins then
		require('packer').sync()
	end
end)
--}}}

-- don't continue if installing plugins for the first time
if install_plugins then
	print('===================================')
	print('    Plugins are being installed    ')
	print('    Wait until Packer completes,   ')
	print('       then restart nvim           ')
	print('===================================')
	return
end

--}}}

-- Plugin settings {{{1

-- telescope {{{2
-- see `:help telescope` and `:help telescope.setup()`
require('telescope').setup({
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			}
		}
	},
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- keymaps {{{3
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope').get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = '[/] Fuzzily search in current buffer' })
--}}}

--}}}

--}}}

-- vim: fdm=marker
