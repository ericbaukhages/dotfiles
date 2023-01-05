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

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
--}}}

--}}}

-- treesitter {{{2
-- see `:help nvim-treesitter`
require('nvim-treesitter.configs').setup({
	ensure_installed = { 'typescript', 'css', 'help', 'vim', 'html' },

	highlight = { enable = true },
	indent = { enable = true },
})
--}}}

-- lsp {{{2
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- keymaps {{{3
	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [D]efinition')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')
	--}}}

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

require('neodev').setup()
require('mason').setup()

local lsp_servers = {
	cssls = {},
	emmet_ls = {},
	eslint = {},
	html = {},
	jsonls = {},
	tailwindcss = {},
	tsserver = {},
}

require('mason-lspconfig').setup({
	ensure_installed = vim.tbl_keys(lsp_servers)
})

require('mason-lspconfig').setup_handlers({
	function(server_name)
		require('lspconfig')[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = lsp_servers[server_name],
		})
	end
})

require('fidget').setup()

require('cmp').setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = require('cmp').mapping.preset.insert({
		['<CR>'] = require('cmp').mapping.confirm({
			behavior = require('cmp').ConfirmBehavior.Replace,
			select = true,
		}),
		['<Tab>'] = require('cmp').mapping(function(fallback)
			if require('cmp').visible() then
				require('cmp').select_next_item()
			elseif require('luasnip').expand_or_jumpable() then
				require('luasnip').expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = require('cmp').mapping(function(fallback)
			if require('cmp').visible() then
				require('cmp').select_prev_item()
			elseif require('luasnip').jumpable(-1) then
				require('luasnip').jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})

--}}}
--}}}

-- vim: fdm=marker ts=2 sts=2 sw=2
