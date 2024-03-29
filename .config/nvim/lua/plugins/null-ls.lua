return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.eslint,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
				}
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
