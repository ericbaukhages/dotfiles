return {
  lsp = function()
  end,
  telescope = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope [f]ind [f]iles" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope [f]ind [b]uffer" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope [f]ind [h]elp tag" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope [s]earch [d]iagnostics" })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope [l]ive [g]rep" })

    -- FIXME: Decide if I want these, or the LSP default commands (see `:help lsp-defaults`)
    -- vim.keymap.set("n", "gD", builtin.lsp_type_definitions, "[G]oto Type [D]efinition")
    -- vim.keymap.set("n", "gd", builtin.lsp_definitions, "[G]oto [D]efinition")
    -- vim.keymap.set("n", "gr", builtin.lsp_references, "[G]oto [R]eferences")
    -- vim.keymap.set("n", "gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
  end
}
