return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.3',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sharkdp/fd',
		'nvim-treesitter/nvim-treesitter',
	},
	keys = {
		{ '<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ '<leader>fg', "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ '<leader>fb', "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
		{ '<leader>fh', "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags" },
	},
}
