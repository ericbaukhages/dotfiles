return {
	"cpplain/flexoki.nvim",
	lazy = false,
	name = "flexoki",
	priority = 1000,
	config = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme "flexoki"
	end
}
