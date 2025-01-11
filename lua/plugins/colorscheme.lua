return {
	"comfysage/evergarden",
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	config = function()
		require("evergarden").setup({
			transparent_background = false,
			variant = "hard",
			override_terminal = true,
			style = {
				tabline = { "reverse" },
				search = { "italic" },
				incsearch = { "reverse" },
				types = { "italic" },
				keyword = { "italic" },
				comment = { "italic" },
				sign = { highlight = false },
			},
			integrations = {
				blink_cmp = true,
				cmp = true,
				gitsigns = true,
				indent_blankline = { enable = true, scope_color = "surface1" },
				nvimtree = true,
				rainbow_delimiters = true,
				symbols_outline = true,
				telescope = true,
				which_key = true,
			},
			overrides = {}, -- add custom overrides
		})
		vim.cmd("colorscheme evergarden")
	end,
}
