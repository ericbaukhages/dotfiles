return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"css",
				"gitcommit",
				"git_config",
				"gitignore",
				"git_rebase",
				"go",
				"html",
				"javascript",
				"jq",
				"json",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"regex",
				"rust",
				"typescript",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>", -- set to `false` to disable one of the mappings
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ao"] = "@comment.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = true,
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
