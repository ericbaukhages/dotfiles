return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				"javascript",
				"lua",
				"tsx",
				"typescript",
			},
			highlight = {
				enabled = true
			}
		})
	end
}
