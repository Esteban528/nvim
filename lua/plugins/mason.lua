local mason_tools = {
  "clangd",
  "css-variables-language-server",
  "html-lsp",
  "lemminx",
  "lua-language-server",
  "prettier",
  "tailwindcss-language-server",
  "xmlformatter",
  "css-lsp",
  "emmet-language-server",
  "jdtls",
  "lombok-nightly",
  "prettierd",
  "stylua",
  "typescript-language-server",
}

local function mason_install_missing()
  local registry = require("mason-registry")
  local missing_tools = {}

  for _, tool in ipairs(mason_tools) do
    if not registry.is_installed(tool) then
      table.insert(missing_tools, tool)
    end
  end

  if #missing_tools > 0 then
    vim.cmd("MasonInstall " .. table.concat(missing_tools, " "))
    print("Installing mason tools: " .. table.concat(missing_tools, ", "))
  else
    print("Mason tools are installed ✅")
  end
end


return {
	{
	"williamboman/mason.nvim",

	config = function()

	require("mason").setup({

	registries = {
	"github:nvim-java/mason-registry",
	"github:mason-org/mason-registry",
	},
	})
      mason_install_missing()
		end,
	},
}
