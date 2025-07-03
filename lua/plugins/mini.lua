return{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.files").setup()
			require("mini.statusline").setup()
			require("mini.pairs").setup()
			require("mini.snippets").setup({})
			vim.keymap.set("n", "<leader>n", ":lua MiniFiles.open() <CR>")

			require("mini.icons").setup()
			-- require("mini.notify").setup()
			require("mini.git").setup()
			require("mini.comment").setup()
			require("mini.pick").setup()
			MiniIcons.mock_nvim_web_devicons()
			require("mini.indentscope").setup({
				draw = {
					-- Delay (in ms) between event and start of drawing scope indicator
					delay = 0,
				},
			})
			require("mini.diff").setup()
			require("mini.extra").setup()
			require("mini.visits").setup({
				config = {
					store = { autowrite = true },
				},
			})

			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },

					-- LSP
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },
					{ mode = "n", keys = "[" },
					{ mode = "x", keys = "[" },
					{ mode = "n", keys = "]" },
					{ mode = "x", keys = "]" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
			-- vim.opt.s

			require("mini.base16").setup({
				palette = require("palette").palette,
				use_cterm = true,
				plugins = {
					default = true,
					["echasnovski/mini.nvim"] = true,
				},
			})
		end,
	}
