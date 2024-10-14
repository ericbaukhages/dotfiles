return {
	"tpope/vim-abolish",
	"tpope/vim-commentary",
	"tpope/vim-eunuch",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	"tpope/vim-vinegar",

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			icons = {
				keys = {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-...> ",
					M = "<M-...> ",
					D = "<D-...> ",
					S = "<S-...> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1> ",
					F2 = "<F2> ",
					F3 = "<F3> ",
					F4 = "<F4> ",
					F5 = "<F5> ",
					F6 = "<F6> ",
					F7 = "<F7> ",
					F8 = "<F8> ",
					F9 = "<F9> ",
					F10 = "<F10> ",
					F11 = "<F11> ",
					F12 = "<F12> ",
				},
			},

			-- Document existing key chains
			-- TODO: have this reflect reality, from a central `keybindings` config
			spec = {
				{ "<leader>c", group = "[C]ode",      mode = { "n", "x", } },
				{ "<leader>d", group = "[D]ocument", },
				{ "<leader>r", group = "[R]ename", },
				{ "<leader>s", group = "[S]earch", },
				{ "<leader>w", group = "[W]orkspace", },
				{ "<leader>t", group = "[T]oggle", },
				{ "<leader>h", group = "Git [H]unk",  mode = { "n", "x", } },
			},
		}
	}
}
