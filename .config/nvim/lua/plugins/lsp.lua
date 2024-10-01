return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})

			local b = vim.lsp.buf
			local map = vim.keymap.set

			map("n", "K", b.hover, {})
			map("n", "gd", b.definition, {})
			map("n", "<leader>ca", b.code_action, {})
		end
	},
}
