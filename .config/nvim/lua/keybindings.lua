local buildMap = function(buffer)
  return function(keys, func, desc, mode)
    local config = { desc = desc }
    if buffer then
      config.buffer = buffer
    end
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, config)
  end
end

return {
  lsp = function(buffer)
    local b = vim.lsp.buf
    local map = buildMap(buffer)

    map("K", b.hover, "[K] Hover")
    map("<leader>ca", b.code_action, "[C]ode [A]ction", { "n", "x" })
    map("<leader>rn", b.rename, "[R]e[n]ame")
  end,
  telescope = function()
    local map = buildMap()
    local builtin = require("telescope.builtin")

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
}
