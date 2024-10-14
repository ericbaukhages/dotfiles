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
					local builtin = require("telescope.builtin")
					local b = vim.lsp.buf
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
					end

					map("K", b.hover, "[K] Hover")
					map("<leader>ca", b.code_action, "[C]ode [A]ction", { "n", "x" })

					map("<leader>sf", builtin.find_files, "[S]earch [F]iles")
					map("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
					map("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
					map("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
					map("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")

					map("gD", builtin.lsp_type_definitions, "[G]oto Type [D]efinition")

					map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
					map("gr", builtin.lsp_references, "[G]oto [R]eferences")
					map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
				end
			})
		end
	},
}
