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
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"eslint",
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			vim.lsp.config("lua_ls", {
				on_init = function(client)
					-- If the workspace has a luarc config, exit early
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
								path ~= vim.fn.stdpath("config")
								and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					-- Set Lua rules, assuming this is the neovim config
					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
							}
						}
					})
				end,
				settings = {
					Lua = {}
				}
			})

			vim.lsp.config("eslint", {
				on_attach = function(client, bufnr)
					if not vim.lsp.config.eslint.on_attach then return end

					vim.lsp.config.eslint.on_attach(client, bufnr)

					-- FIXME: figure out why this isn't working as expected
					-- vim.api.nvim_create_autocmd("BufWritePre", {
					-- 	buffer = bufnr,
					-- 	command = "LspEslintFixAll",
					-- })
				end,
			})

			vim.lsp.enable("ts_ls")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function()
					require("../keybindings").lsp()
				end
			})
		end
	},
}
