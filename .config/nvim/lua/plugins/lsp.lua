local servers = {
	"lua_ls",
	"ts_ls",
}

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
				ensure_installed = servers
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			for _, server in ipairs(servers) do
				lspconfig[server].setup({})
			end

			local b = vim.lsp.buf
			local map = vim.keymap.set

			map("n", "K", b.hover, {})
			map("n", "gd", b.definition, {})
			map("n", "<leader>ca", b.code_action, {})
		end
	},
}
