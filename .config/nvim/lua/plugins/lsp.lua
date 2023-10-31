return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			-- Setup language servers.
			local lsp_servers = {
				"eslint",
				"lua_ls",
				"tailwindcss",
				"tsserver",
			}

			for _,v in ipairs(lsp_servers) do
				require('lspconfig')[v].setup({})
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			local d = vim.diagnostic
			local diagnostic_mappings = {
				{ '<space>e', d.open_float },
				{ '[d', d.goto_prev },
				{ ']d', d.goto_next },
				{ '<space>q', d.setloclist },
			}

			for _,v in ipairs(diagnostic_mappings) do
				vim.keymap.set('n', v[1], v[2])
			end

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local b = vim.lsp.buf
					local local_mappings = {
						{ 'gD', b.declaration },
						{ 'gd', b.definition },
						{ 'K', b.hover },
						{ 'gi', b.implementation },
						{ '<C-k>', b.signature_help },
						{ '<space>wa', b.add_workspace_folder },
						{ '<space>wr', b.remove_workspace_folder },
						{ '<space>D', b.type_definition },
						{ '<space>rn', b.rename },
						{ 'gr', b.references },
					}

					for _,v in ipairs(local_mappings) do
						vim.keymap.set('n', v[1], v[2], { buffer = ev.buf })
					end

					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = ev.buf })
				end,
			})
		end
	},
}
