local function split_pattern(input, sep_pattern)
	local parts = {}
	local last_end = 1

	while true do
		local start_pos, end_pos = string.find(input, sep_pattern, last_end)
		if not start_pos then
			table.insert(parts, string.sub(input, last_end))
			break
		end
		table.insert(parts, string.sub(input, last_end, start_pos - 1))
		last_end = end_pos + 1
	end

	return parts
end

return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"supermaven-inc/supermaven-nvim",
			config = function()
				local suggestion = require("supermaven-nvim").setup({
					disable_inline_completion = true,
					disable_keymaps = true,
				})

				vim.keymap.set("i", "<C-l>", function()
					local suggestion = require("supermaven-nvim.completion_preview")

					if suggestion.has_suggestion() then
						suggestion.on_accept_suggestion()
					end
				end, { silent = true })

				local api = require("supermaven-nvim.api")
				vim.keymap.set("n", "<leader>e", api.toggle, { desc = "Toggle ai"})
			end,
		},
		{
			"huijiro/blink-cmp-supermaven",
		},
	},
	version = "*",
	opts = {
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "supermaven" },
			providers = {
				supermaven = {
					name = "supermaven",
					module = "blink-cmp-supermaven",
					async = true,
				},
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},

			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
						kind = {
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
						label = {
							width = { fill = true, max = 60 },
							text = function(ctx)
								return string.format("%-25s", ctx.label .. ctx.label_detail)
							end,
							highlight = function(ctx)
								print(vim.inspect(ctx.kind), vim.inspect(ctx.kind_hl))

								local highlights = {}
								local label = ctx.label
								local kind_hl = ctx.kind_hl

								local label_section = split_pattern(label, "[:%-%|=]%s*")

								if ctx.deprecated then
									table.insert(highlights, {
										0,
										#label,
										group = "BlinkCmpLabelDeprecated",
									})
								elseif type(label_section) == "table" and #label_section >= 2 then
									local start = 1
									local end_ = start + #label_section[1]

									table.insert(highlights, {
										start - 1,
										end_ - 1,
										group = kind_hl,
									})

									for _, idx in ipairs(ctx.label_matched_indices or {}) do
										table.insert(highlights, {
											idx,
											idx + 1,
											group = "BlinkCmpLabelMatch",
										})
									end
								else
									return ctx.kind_hl
								end

								return highlights
							end,
						},
					},
				},
				enabled = true,
				min_width = 35,
				max_height = 10,
				border = nil,
			},
		},

		signature = { enabled = true },
		-- fuzzy = {
		-- 	implementation = "rust",
		-- 	-- use_typo_resistance = false,
		-- 	use_proximity = true,
		-- 	sorts = { "exact", "score", "sort_text" },
		-- },
		snippets = {
			--preset = "mini_snippets",
		},
		appearance = {
			highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
			nerd_font_variant = "mono",
		},

		keymap = {
			preset = "none",

			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

			["<C-y>"] = {
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
