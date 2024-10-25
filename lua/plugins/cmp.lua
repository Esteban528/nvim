---@diagnostic disable: missing-fields

return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3",
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			-- CMP
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			--
			"onsails/lspkind.nvim",
			"windwp/nvim-ts-autotag",
			"windwp/nvim-autopairs",
			"rafamadriz/friendly-snippets",
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opt = {
					completion = {
						completeopt = "menu,menuone,noinsert",
						cmp = { enabled = true },
					},
				},
			},
			{
				"L3MON4D3/LuaSnip",
				version = "v2.3",
			},
		},
		config = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local tailwind_colorizer = require("tailwindcss-colorizer-cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					-- { name = "copilot" },
					{ name = "buffer", max_item_count = 3 },
					{ name = "path", max_item_count = 4 },
					{ name = "luasnip", max_item_count = 3 },
				}),
				formatting = {
					expandable_indicator = true,
					format = function(entry, vim_item)
						vim_item = lspkind.cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
							ellipsis_char = "...",
							symbol_map = {
								Copilot = "",
							},
						})(entry, vim_item)

						vim_item = tailwind_colorizer.formatter(entry, vim_item)

						return vim_item
					end,
				},
				experimental = {
					ghost_text = false,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
}
