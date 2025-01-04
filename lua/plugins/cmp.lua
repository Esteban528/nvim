return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "*",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			keyword = { range = "full" },

			accept = { auto_brackets = { enabled = true } },
			-- Insert completion item on selection, don't select by default
			-- list = { selection = "auto_insert" },

			menu = {
				auto_show = true,

				-- nvim-cmp style menu
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 0.5 },
            {"kind"}
					},
				}
			},

			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },

			trigger = {
				show_on_insert_on_trigger_character = true,
			},
		},

		keymap = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			preset = "none",

			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },

			-- disable a keymap from the preset
			["<C-e>"] = {},

			-- show with a list of providers
			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},

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

			-- control whether the next command will be run when using a function
			-- ["<C-n>"] = {
			-- 	function(cmp)
			-- 		if some_condition then
			-- 			return
			-- 		end -- runs the next command
			-- 		return true -- doesn't run the next command
			-- 	end,
			-- 	"select_next",
			-- },
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			-- use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "normal",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
				},
			},
		},
	},
	opts_extend = { "sources.default" },
	signature = { enabled = true },
}
