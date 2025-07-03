return {
	{
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
			MiniIcons.mock_nvim_web_devicons()
			require("mini.indentscope").setup({
				draw = {
					-- Delay (in ms) between event and start of drawing scope indicator
					delay = 0,
				},
			})
			require("mini.diff").setup()
			vim.cmd("set signcolumn=number")
			-- vim.opt.s

			require("mini.base16").setup({
				palette = {
					base00 = "#1D1C19", -- dragon_black_2
					base01 = "#12120F", -- dragon_black_1
					base02 = "#282727", -- dragon_black_4
					base03 = "#625E5A", -- dragon_black_6
					base04 = "#737C73", -- dragon_ash
					base05 = "#C5C9C5", -- dragon_white
					base06 = "#C4B28A", -- dragon_yellow
					base07 = "#7A8382", -- dragon_gray_3
					base08 = "#C4746E", -- dragon_red
					base09 = "#B98D7B", -- dragon_orange_2
					base0A = "#C4B28A", -- dragon_yellow
					base0B = "#87A987", -- dragon_green
					base0C = "#8EA4A2", -- dragon_aqua
					base0D = "#8BA4B0", -- dragon_blue_2
					base0E = "#8992A7", -- dragon_violet
					base0F = "#A292A3", -- dragon_pink
				},
				use_cterm = true,
				plugins = {
					default = true,
					["echasnovski/mini.nvim"] = true,
				},
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		-- "tpope/vim-sleuth",
	},
}
