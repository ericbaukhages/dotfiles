return {
  lsp = function()
  end,
  telescope = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope [s]earch [f]iles" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope [s]earch [b]uffer" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope [s]earch [h]elp tag" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope [s]earch [d]iagnostics" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope [s]earch [g]rep" })

    vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { desc = "[G]oto Type [D]efinition" })
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
    vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
    vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
  end
}
