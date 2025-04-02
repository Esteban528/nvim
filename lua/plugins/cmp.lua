return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},
	version = "*",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		keymap = {
			preset = "none",

			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

			["<Enter>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
		},
	},
}
