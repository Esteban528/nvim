local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local buf = event.buf

    local function map(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
    end

    local telescope_ok, telescope = pcall(require, "telescope.builtin")
    if telescope_ok then
      map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
      map("gr", telescope.lsp_references, "[G]oto [R]eferences")
      map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
      map("<leader>dd", telescope.lsp_type_definitions, "Type [D]efinition")
      map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
      map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    else
      vim.notify("Telescope not found", vim.log.levels.WARN)
    end

    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    -- map("<leader>ca", function() require("lspsaga.codeaction").code_action() end, "[C]ode [A]ction")
    map("gD", function() require("lspsaga.peek").peek_definition() end, "[G]oto [D]eclaration")
    map("<leader>cs", vim.lsp.codelens.run, "Run Codelens")
    map("<leader>cc", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
    map("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
    map("]d", diagnostic_goto(true), "Next Diagnostic")
    map("[d", diagnostic_goto(false), "Prev Diagnostic")
    map("]e", diagnostic_goto(true, "ERROR"), "Next Error")
    map("[e", diagnostic_goto(false, "ERROR"), "Prev Error")
    map("]w", diagnostic_goto(true, "WARN"), "Next Warning")
    map("[w", diagnostic_goto(false, "WARN"), "Prev Warning")
  end,
})


vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- local installed_servers = require("mason-registry").get_installed_package_names()
-- vim.lsp.config('clangd', require('lspconfig.configs.clangd').default_config)
-- Load LSP
