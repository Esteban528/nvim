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
			keyword = { range = "full" },

			accept = { auto_brackets = { enabled = true } },

			list = {
				selection = {
					preselect = true,
				},
			},

			menu = {
				auto_show = true,

				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 0.5 },
						{ "kind" },
					},
				},
			},

			ghost_text = { enabled = true },

			trigger = {
				show_on_insert_on_trigger_character = true,
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
			cmdline = {
				preset = "default",
			},
		},
		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
				},
			},
		},
		-- opts_extend = { "sources.default" },
		snippets = { preset = "default" },
		signature = { enabled = true },
	},
}
