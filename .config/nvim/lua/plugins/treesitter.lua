local languages = {
	"javascript",
	"lua",
	"markdown",
	"typescript",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = languages,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
