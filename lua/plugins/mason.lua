if true then
	return {}
end

local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
}

M.opts = {
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"html",
		"cssls",
		"intelephense",
		"jdtls",
		"tailwindcss",
		"emmet_language_server",
	},
}

M.init = function()
	require("mason").setup()
	require("mason-lspconfig").setup()
end

M.config = function()
	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for tsserver)
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
			jdtls = function()
				require("java").setup({
					-- Your custom jdtls settings goes here
				})

				require("lspconfig").jdtls.setup({
					-- Your custom nvim-java configuration goes here
				})
			end,
		},
	})

	local lspconfig = require("lspconfig")
	local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	require("lspconfig").lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})
end

return M
