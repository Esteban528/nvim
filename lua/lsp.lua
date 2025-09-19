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

		map("gd", vim.lsp.buf.definition, "Go to definition")

		-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		-- map("<leader>ca", function() require("lspsaga.codeaction").code_action() end, "[C]ode [A]ction")
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

-- require("java").setup({})
vim.lsp.enable("luals")
--vim.lsp.enable("jdtls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("html_lsp")
vim.lsp.enable("csslsp")
vim.lsp.enable("emmetls")
vim.lsp.enable("tailwindls")
vim.lsp.enable("lemminx")
vim.lsp.enable("angular")
vim.lsp.enable("gopls")
