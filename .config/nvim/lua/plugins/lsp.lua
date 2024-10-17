local servers = {
	"lua_ls",
	"ts_ls",
	"eslint",
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
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			for _, server in ipairs(servers) do
				lspconfig[server].setup({})
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					require("../keybindings").lsp(event.buf)
				end
			})
		end
	},
}
